typedef struct { int dummy; } lua_State;
typedef struct { int dummy; } ngx_http_request_t;


provider nginx_lua {
    probe http__lua__register__preload__package(lua_State *L, char *pkg);
    probe http__lua__req__socket__consume__preread(ngx_http_request_t *r,
                                                   char *data, size_t len);
    probe http__lua__user__coroutine__create(ngx_http_request_t *r,
                                             lua_State *parent, lua_State *child);
    probe http__lua__user__coroutine__resume(ngx_http_request_t *r,
                                             lua_State *parent, lua_State *child);
};


#pragma D attributes Evolving/Evolving/Common      provider nginx_lua provider
#pragma D attributes Private/Private/Unknown       provider nginx_lua module
#pragma D attributes Private/Private/Unknown       provider nginx_lua function
#pragma D attributes Private/Private/Common        provider nginx_lua name
#pragma D attributes Evolving/Evolving/Common      provider nginx_lua args

