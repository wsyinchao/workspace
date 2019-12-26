#include "lauxlib.h"
#include "lua.h"

int lsub(lua_State *L)
{
    int a = luaL_checkinteger(L, 1);
    int b = luaL_checkinteger(L, 2);

    lua_pushinteger(L, a - b);

    return 1;
}

static const struct luaL_Reg lib[] = {
    {"sub", lsub},
    {NULL, NULL},
};

// How to put several modules together?
int luaopen_clib_s(lua_State *L)
{
    luaL_newlib(L, lib);
    return 1;
}
