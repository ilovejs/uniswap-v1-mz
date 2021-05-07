interface Exchange:
    def setup(token_addr: address): nonpayable

event NewExchange:
    token: indexed(address)
    exchange: indexed(address)

exchangeTemplate: public(address)
tokenCount: public(uint256)

token_to_exchange: HashMap[address, address]
exchange_to_token: HashMap[address, address]

# used be array like address[uint256]
id_to_token: HashMap[uint256, address]

@external
def initializeFactory(template: address):
    assert self.exchangeTemplate == ZERO_ADDRESS
    assert template != ZERO_ADDRESS
    self.exchangeTemplate = template

@external
def createExchange(token: address) -> address:
    assert token != ZERO_ADDRESS
    assert self.exchangeTemplate != ZERO_ADDRESS
    assert self.token_to_exchange[token] == ZERO_ADDRESS
    # vyper built-in function
    # https://github.com/vyperlang/vyper/search?q=create_forwarder_to
    exchange: address = create_forwarder_to(self.exchangeTemplate)

    Exchange(exchange).setup(token)
    self.token_to_exchange[token] = exchange
    self.exchange_to_token[exchange] = token

    token_id: uint256 = self.tokenCount + 1
    self.tokenCount = token_id

    self.id_to_token[token_id] = token

    log NewExchange(token, exchange)
    return exchange

@external
@view
def getExchange(token: address) -> address:
    return self.token_to_exchange[token]

@external
@view
def getToken(exchange: address) -> address:
    return self.exchange_to_token[exchange]

@external
@view
def getTokenWithId(token_id: uint256) -> address:
    return self.id_to_token[token_id]
