#include "lauxlib.h"
#include "lua.h"

int ladd(lua_State *L)
{
    int a = luaL_checkinteger(L, 1);
    int b = luaL_checkinteger(L, 2);

    lua_pushinteger(L, a + b);

    return 1;
}

static const struct luaL_Reg lib[] = {
    {"add", ladd},
    {NULL, NULL},
};

int luaopen_clib_c(lua_State *L)
{
    luaL_newlib(L, lib);
    return 1;
}
