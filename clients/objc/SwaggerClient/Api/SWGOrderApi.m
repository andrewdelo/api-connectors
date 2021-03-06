#import "SWGOrderApi.h"
#import "SWGQueryParamCollection.h"
#import "SWGError.h"
#import "SWGOrder.h"


@interface SWGOrderApi ()

@property (nonatomic, strong) NSMutableDictionary *defaultHeaders;

@end

@implementation SWGOrderApi

NSString* kSWGOrderApiErrorDomain = @"SWGOrderApiErrorDomain";
NSInteger kSWGOrderApiMissingParamErrorCode = 234513;

@synthesize apiClient = _apiClient;

#pragma mark - Initialize methods

- (instancetype) init {
    self = [super init];
    if (self) {
        SWGConfiguration *config = [SWGConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[SWGApiClient alloc] init];
        }
        _apiClient = config.apiClient;
        _defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(SWGApiClient *)apiClient {
    self = [super init];
    if (self) {
        _apiClient = apiClient;
        _defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+ (instancetype)sharedAPI {
    static SWGOrderApi *sharedAPI;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedAPI = [[self alloc] init];
    });
    return sharedAPI;
}

-(NSString*) defaultHeaderForKey:(NSString*)key {
    return self.defaultHeaders[key];
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self setDefaultHeaderValue:value forKey:key];
}

-(void) setDefaultHeaderValue:(NSString*) value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(NSUInteger) requestQueueSize {
    return [SWGApiClient requestQueueSize];
}

#pragma mark - Api Methods

///
/// Amend the quantity or price of an open order.
/// Send an `orderID` or `origClOrdID` to identify the order you wish to amend.  Both order quantity and price can be amended. Only one `qty` field can be used to amend.  Use the `leavesQty` field to specify how much of the order you wish to remain open. This can be useful if you want to adjust your position's delta by a certain amount, regardless of how much of the order has already filled.  Use the `simpleOrderQty` and `simpleLeavesQty` fields to specify order size in Bitcoin, rather than contracts. These fields will round up to the nearest contract.  Like order placement, amending can be done in bulk. Simply send a request to `PUT /api/v1/order/bulk` with a JSON body of the shape: `{\"orders\": [{...}, {...}]}`, each object containing the fields used in this endpoint. 
///  @param orderID Order ID (optional)
///
///  @param origClOrdID Client Order ID. See POST /order. (optional)
///
///  @param clOrdID Optional new Client Order ID, requires `origClOrdID`. (optional)
///
///  @param simpleOrderQty Optional order quantity in units of the underlying instrument (i.e. Bitcoin). (optional)
///
///  @param orderQty Optional order quantity in units of the instrument (i.e. contracts). (optional)
///
///  @param simpleLeavesQty Optional leaves quantity in units of the underlying instrument (i.e. Bitcoin). Useful for amending partially filled orders. (optional)
///
///  @param leavesQty Optional leaves quantity in units of the instrument (i.e. contracts). Useful for amending partially filled orders. (optional)
///
///  @param price Optional limit price for 'Limit', 'StopLimit', and 'LimitIfTouched' orders. (optional)
///
///  @param stopPx Optional trigger price for 'Stop', 'StopLimit', 'MarketIfTouched', and 'LimitIfTouched' orders. Use a price below the current price for stop-sell orders and buy-if-touched orders. (optional)
///
///  @param pegOffsetValue Optional trailing offset from the current price for 'Stop', 'StopLimit', 'MarketIfTouched', and 'LimitIfTouched' orders; use a negative offset for stop-sell orders and buy-if-touched orders. Optional offset from the peg price for 'Pegged' orders. (optional)
///
///  @param text Optional amend annotation. e.g. 'Adjust skew'. (optional)
///
///  @returns SWGOrder*
///
-(NSNumber*) orderAmendWithOrderID: (NSString*) orderID
    origClOrdID: (NSString*) origClOrdID
    clOrdID: (NSString*) clOrdID
    simpleOrderQty: (NSNumber*) simpleOrderQty
    orderQty: (NSNumber*) orderQty
    simpleLeavesQty: (NSNumber*) simpleLeavesQty
    leavesQty: (NSNumber*) leavesQty
    price: (NSNumber*) price
    stopPx: (NSNumber*) stopPx
    pegOffsetValue: (NSNumber*) pegOffsetValue
    text: (NSString*) text
    completionHandler: (void (^)(SWGOrder* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json", @"application/xml", @"text/xml", @"application/javascript", @"text/javascript"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    if (orderID) {
        formParams[@"orderID"] = orderID;
    }
    if (origClOrdID) {
        formParams[@"origClOrdID"] = origClOrdID;
    }
    if (clOrdID) {
        formParams[@"clOrdID"] = clOrdID;
    }
    if (simpleOrderQty) {
        formParams[@"simpleOrderQty"] = simpleOrderQty;
    }
    if (orderQty) {
        formParams[@"orderQty"] = orderQty;
    }
    if (simpleLeavesQty) {
        formParams[@"simpleLeavesQty"] = simpleLeavesQty;
    }
    if (leavesQty) {
        formParams[@"leavesQty"] = leavesQty;
    }
    if (price) {
        formParams[@"price"] = price;
    }
    if (stopPx) {
        formParams[@"stopPx"] = stopPx;
    }
    if (pegOffsetValue) {
        formParams[@"pegOffsetValue"] = pegOffsetValue;
    }
    if (text) {
        formParams[@"text"] = text;
    }

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PUT"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGOrder*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGOrder*)data, error);
                                }
                           }
          ];
}

///
/// Amend multiple orders.
/// Similar to POST /amend, but with multiple orders. `application/json` only. Ratelimited at 50%.
///  @param orders An array of orders. (optional)
///
///  @returns NSArray<SWGOrder>*
///
-(NSNumber*) orderAmendBulkWithOrders: (NSString*) orders
    completionHandler: (void (^)(NSArray<SWGOrder>* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/bulk"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json", @"application/xml", @"text/xml", @"application/javascript", @"text/javascript"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    if (orders) {
        formParams[@"orders"] = orders;
    }

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PUT"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"NSArray<SWGOrder>*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((NSArray<SWGOrder>*)data, error);
                                }
                           }
          ];
}

///
/// Cancel order(s). Send multiple order IDs to cancel in bulk.
/// Either an orderID or a clOrdID must be provided.
///  @param orderID Order ID(s). (optional)
///
///  @param clOrdID Client Order ID(s). See POST /order. (optional)
///
///  @param text Optional cancellation annotation. e.g. 'Spread Exceeded'. (optional)
///
///  @returns NSArray<SWGOrder>*
///
-(NSNumber*) orderCancelWithOrderID: (NSString*) orderID
    clOrdID: (NSString*) clOrdID
    text: (NSString*) text
    completionHandler: (void (^)(NSArray<SWGOrder>* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json", @"application/xml", @"text/xml", @"application/javascript", @"text/javascript"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    if (orderID) {
        formParams[@"orderID"] = orderID;
    }
    if (clOrdID) {
        formParams[@"clOrdID"] = clOrdID;
    }
    if (text) {
        formParams[@"text"] = text;
    }

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"NSArray<SWGOrder>*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((NSArray<SWGOrder>*)data, error);
                                }
                           }
          ];
}

///
/// Cancels all of your orders.
/// 
///  @param symbol Optional symbol. If provided, only cancels orders for that symbol. (optional)
///
///  @param filter Optional filter for cancellation. Use to only cancel some orders, e.g. `{\"side\": \"Buy\"}`. (optional)
///
///  @param text Optional cancellation annotation. e.g. 'Spread Exceeded' (optional)
///
///  @returns NSObject*
///
-(NSNumber*) orderCancelAllWithSymbol: (NSString*) symbol
    filter: (NSString*) filter
    text: (NSString*) text
    completionHandler: (void (^)(NSObject* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/all"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json", @"application/xml", @"text/xml", @"application/javascript", @"text/javascript"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    if (symbol) {
        formParams[@"symbol"] = symbol;
    }
    if (filter) {
        formParams[@"filter"] = filter;
    }
    if (text) {
        formParams[@"text"] = text;
    }

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"NSObject*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((NSObject*)data, error);
                                }
                           }
          ];
}

///
/// Automatically cancel all your orders after a specified timeout.
/// Useful as a dead-man's switch to ensure your orders are canceled in case of an outage. If called repeatedly, the existing offset will be canceled and a new one will be inserted in its place.  Example usage: call this route at 15s intervals with an offset of 60000 (60s). If this route is not called within 60 seconds, all your orders will be automatically canceled.  This is also available via [WebSocket](https://www.bitmex.com/app/wsAPI#dead-man-s-switch-auto-cancel-). 
///  @param timeout Timeout in ms. Set to 0 to cancel this timer.  
///
///  @returns NSObject*
///
-(NSNumber*) orderCancelAllAfterWithTimeout: (NSNumber*) timeout
    completionHandler: (void (^)(NSObject* output, NSError* error)) handler {
    // verify the required parameter 'timeout' is set
    if (timeout == nil) {
        NSParameterAssert(timeout);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"timeout"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderApiErrorDomain code:kSWGOrderApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/cancelAllAfter"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json", @"application/xml", @"text/xml", @"application/javascript", @"text/javascript"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    if (timeout) {
        formParams[@"timeout"] = timeout;
    }

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"NSObject*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((NSObject*)data, error);
                                }
                           }
          ];
}

///
/// Close a position. [Deprecated, use POST /order with execInst: 'Close']
/// If no `price` is specified, a market order will be submitted to close the whole of your position. This will also close all other open orders in this symbol.
///  @param symbol Symbol of position to close. 
///
///  @param price Optional limit price. (optional)
///
///  @returns SWGOrder*
///
-(NSNumber*) orderClosePositionWithSymbol: (NSString*) symbol
    price: (NSNumber*) price
    completionHandler: (void (^)(SWGOrder* output, NSError* error)) handler {
    // verify the required parameter 'symbol' is set
    if (symbol == nil) {
        NSParameterAssert(symbol);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"symbol"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderApiErrorDomain code:kSWGOrderApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/closePosition"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json", @"application/xml", @"text/xml", @"application/javascript", @"text/javascript"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    if (symbol) {
        formParams[@"symbol"] = symbol;
    }
    if (price) {
        formParams[@"price"] = price;
    }

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGOrder*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGOrder*)data, error);
                                }
                           }
          ];
}

///
/// Get your orders.
/// To get open orders only, send {\"open\": true} in the filter param.  See <a href=\"http://www.onixs.biz/fix-dictionary/5.0.SP2/msgType_D_68.html\">the FIX Spec</a> for explanations of these fields.
///  @param symbol Instrument symbol. Send a bare series (e.g. XBU) to get data for the nearest expiring contract in that series.  You can also send a timeframe, e.g. `XBU:monthly`. Timeframes are `daily`, `weekly`, `monthly`, `quarterly`, and `biquarterly`. (optional)
///
///  @param filter Generic table filter. Send JSON key/value pairs, such as `{\"key\": \"value\"}`. You can key on individual fields, and do more advanced querying on timestamps. See the [Timestamp Docs](https://www.bitmex.com/app/restAPI#timestamp-filters) for more details. (optional)
///
///  @param columns Array of column names to fetch. If omitted, will return all columns.  Note that this method will always return item keys, even when not specified, so you may receive more columns that you expect. (optional)
///
///  @param count Number of results to fetch. (optional, default to 100)
///
///  @param start Starting point for results. (optional, default to 0)
///
///  @param reverse If true, will sort results newest first. (optional, default to false)
///
///  @param startTime Starting date filter for results. (optional)
///
///  @param endTime Ending date filter for results. (optional)
///
///  @returns NSArray<SWGOrder>*
///
-(NSNumber*) orderGetOrdersWithSymbol: (NSString*) symbol
    filter: (NSString*) filter
    columns: (NSString*) columns
    count: (NSNumber*) count
    start: (NSNumber*) start
    reverse: (NSNumber*) reverse
    startTime: (NSDate*) startTime
    endTime: (NSDate*) endTime
    completionHandler: (void (^)(NSArray<SWGOrder>* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (symbol != nil) {
        queryParams[@"symbol"] = symbol;
    }
    if (filter != nil) {
        queryParams[@"filter"] = filter;
    }
    if (columns != nil) {
        queryParams[@"columns"] = columns;
    }
    if (count != nil) {
        queryParams[@"count"] = count;
    }
    if (start != nil) {
        queryParams[@"start"] = start;
    }
    if (reverse != nil) {
        queryParams[@"reverse"] = reverse;
    }
    if (startTime != nil) {
        queryParams[@"startTime"] = startTime;
    }
    if (endTime != nil) {
        queryParams[@"endTime"] = endTime;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json", @"application/xml", @"text/xml", @"application/javascript", @"text/javascript"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"NSArray<SWGOrder>*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((NSArray<SWGOrder>*)data, error);
                                }
                           }
          ];
}

///
/// Create a new order.
/// This endpoint is used for placing orders. Valid order types are Market, Limit, Stop, StopLimit, MarketIfTouched, LimitIfTouched, MarketWithLeftOverAsLimit, and Pegged.  If no order type is provided, BitMEX will assume 'Limit'. Be very careful with 'Market' and 'Stop' orders as you may be filled at an unfavourable price.  You can submit bulk orders by POSTing an array of orders to `/api/v1/order/bulk`. Send a JSON payload with the shape: `{\"orders\": [{...}, {...}]}`, with each inner object containing the same fields that would be sent to this endpoint.  A note on API tools: if you want to keep track of order IDs yourself, set a unique clOrdID per order. This clOrdID will come back as a property on the order and any related executions (including on the WebSocket), and can be used to get or cancel the order. Max length is 36 characters.  To generate a clOrdID, consider setting a prefix, and incrementing a counter or generating a UUID. Some UUIDs are longer than 36 characters, so use a url-safe base64 encoding. For example, the prefix `'bmex_mm_'` and the UUID `'7fbd6545-bb0c-11e4-a273-6003088a7c04'` creates `'bmex_mm_f71lRbsMEeSic2ADCIp8BA'`.  See the [BitMEX Reference Market Maker](https://github.com/BitMEX/market-maker/blob/22c75a2b6db63e20212813e9afdb845db1b09b2a/bitmex.py#L152) for an example of how to use and generate clOrdIDs. 
///  @param symbol Instrument symbol. e.g. 'XBT24H'. 
///
///  @param side Order side. Valid options: Buy, Sell. Defaults to 'Buy' unless `orderQty` or `simpleOrderQty` is negative. (optional)
///
///  @param simpleOrderQty Order quantity in units of the underlying instrument (i.e. Bitcoin). (optional)
///
///  @param quantity Deprecated: use `orderQty`. (optional)
///
///  @param orderQty Order quantity in units of the instrument (i.e. contracts). (optional)
///
///  @param price Optional limit price for 'Limit', 'StopLimit', and 'LimitIfTouched' orders. (optional)
///
///  @param displayQty Optional quantity to display in the book. Use 0 for a hidden order. (optional)
///
///  @param stopPrice Deprecated: use `stopPx`. (optional)
///
///  @param stopPx Optional trigger price for 'Stop', 'StopLimit', 'MarketIfTouched', and 'LimitIfTouched' orders. Use a price below the current price for stop-sell orders and buy-if-touched orders. Use `execInst` of 'MarkPrice' or 'LastPrice' to define the current price used for triggering. (optional)
///
///  @param clOrdID Optional Client Order ID. This clOrdID will come back on the order and any related executions. (optional)
///
///  @param clOrdLinkID Optional Client Order Link ID for contingent orders. (optional)
///
///  @param pegOffsetValue Optional trailing offset from the current price for 'Stop', 'StopLimit', 'MarketIfTouched', and 'LimitIfTouched' orders; use a negative offset for stop-sell orders and buy-if-touched orders. Optional offset from the peg price for 'Pegged' orders. (optional)
///
///  @param pegPriceType Optional peg price type. Valid options: LastPeg, MidPricePeg, MarketPeg, PrimaryPeg, TrailingStopPeg, TrailingStopPeg. (optional)
///
///  @param type Deprecated: use `ordType`. (optional)
///
///  @param ordType Order type. Valid options: Market, Limit, Stop, StopLimit, MarketIfTouched, LimitIfTouched, MarketWithLeftOverAsLimit, Pegged. Defaults to 'Limit' when `price` is specified. Defaults to 'Stop' when `stopPx` is specified. Defaults to 'StopLimit' when `price` and `stopPx` are specified. (optional, default to Limit)
///
///  @param timeInForce Time in force. Valid options: Day, GoodTillCancel, ImmediateOrCancel, FillOrKill. Defaults to 'GoodTillCancel' for 'Limit', 'StopLimit', 'LimitIfTouched', and 'MarketWithLeftOverAsLimit' orders. (optional)
///
///  @param execInst Optional execution instructions. Valid options: ParticipateDoNotInitiate, AllOrNone, MarkPrice, IndexPrice, LastPrice, Close, ReduceOnly, Fixed. 'AllOrNone' instruction requires `displayQty` to be 0. 'MarkPrice' or 'LastPrice' instruction valid for 'Stop', 'StopLimit', 'MarketIfTouched', and 'LimitIfTouched' orders. (optional)
///
///  @param contingencyType Optional contingency type for use with `clOrdLinkID`. Valid options: OneCancelsTheOther, OneTriggersTheOther, OneUpdatesTheOtherAbsolute, OneUpdatesTheOtherProportional. (optional)
///
///  @param text Optional order annotation. e.g. 'Take profit'. (optional)
///
///  @returns SWGOrder*
///
-(NSNumber*) orderNewWithSymbol: (NSString*) symbol
    side: (NSString*) side
    simpleOrderQty: (NSNumber*) simpleOrderQty
    quantity: (NSNumber*) quantity
    orderQty: (NSNumber*) orderQty
    price: (NSNumber*) price
    displayQty: (NSNumber*) displayQty
    stopPrice: (NSNumber*) stopPrice
    stopPx: (NSNumber*) stopPx
    clOrdID: (NSString*) clOrdID
    clOrdLinkID: (NSString*) clOrdLinkID
    pegOffsetValue: (NSNumber*) pegOffsetValue
    pegPriceType: (NSString*) pegPriceType
    type: (NSString*) type
    ordType: (NSString*) ordType
    timeInForce: (NSString*) timeInForce
    execInst: (NSString*) execInst
    contingencyType: (NSString*) contingencyType
    text: (NSString*) text
    completionHandler: (void (^)(SWGOrder* output, NSError* error)) handler {
    // verify the required parameter 'symbol' is set
    if (symbol == nil) {
        NSParameterAssert(symbol);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"symbol"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderApiErrorDomain code:kSWGOrderApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json", @"application/xml", @"text/xml", @"application/javascript", @"text/javascript"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    if (symbol) {
        formParams[@"symbol"] = symbol;
    }
    if (side) {
        formParams[@"side"] = side;
    }
    if (simpleOrderQty) {
        formParams[@"simpleOrderQty"] = simpleOrderQty;
    }
    if (quantity) {
        formParams[@"quantity"] = quantity;
    }
    if (orderQty) {
        formParams[@"orderQty"] = orderQty;
    }
    if (price) {
        formParams[@"price"] = price;
    }
    if (displayQty) {
        formParams[@"displayQty"] = displayQty;
    }
    if (stopPrice) {
        formParams[@"stopPrice"] = stopPrice;
    }
    if (stopPx) {
        formParams[@"stopPx"] = stopPx;
    }
    if (clOrdID) {
        formParams[@"clOrdID"] = clOrdID;
    }
    if (clOrdLinkID) {
        formParams[@"clOrdLinkID"] = clOrdLinkID;
    }
    if (pegOffsetValue) {
        formParams[@"pegOffsetValue"] = pegOffsetValue;
    }
    if (pegPriceType) {
        formParams[@"pegPriceType"] = pegPriceType;
    }
    if (type) {
        formParams[@"type"] = type;
    }
    if (ordType) {
        formParams[@"ordType"] = ordType;
    }
    if (timeInForce) {
        formParams[@"timeInForce"] = timeInForce;
    }
    if (execInst) {
        formParams[@"execInst"] = execInst;
    }
    if (contingencyType) {
        formParams[@"contingencyType"] = contingencyType;
    }
    if (text) {
        formParams[@"text"] = text;
    }

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGOrder*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGOrder*)data, error);
                                }
                           }
          ];
}

///
/// Create multiple new orders.
/// This endpoint is used for placing bulk orders. Valid order types are Market, Limit, Stop, StopLimit, MarketIfTouched, LimitIfTouched, MarketWithLeftOverAsLimit, and Pegged.  Each individual order object in the array should have the same properties as an individual POST /order call.  This endpoint is much faster for getting many orders into the book at once. Because it reduces load on BitMEX systems, this endpoint is ratelimited at `ceil(0.5 * orders)`. Submitting 10 orders via a bulk order call will only count as 5 requests.  For now, only `application/json` is supported on this endpoint. 
///  @param orders An array of orders. (optional)
///
///  @returns NSArray<SWGOrder>*
///
-(NSNumber*) orderNewBulkWithOrders: (NSString*) orders
    completionHandler: (void (^)(NSArray<SWGOrder>* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/bulk"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json", @"application/xml", @"text/xml", @"application/javascript", @"text/javascript"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    if (orders) {
        formParams[@"orders"] = orders;
    }

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"NSArray<SWGOrder>*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((NSArray<SWGOrder>*)data, error);
                                }
                           }
          ];
}



@end
