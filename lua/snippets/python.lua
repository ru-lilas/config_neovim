local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local function function_body()
    return {
        t("def "),
        i(1, "func"),
        t({"():", "\treturn"}),
        i(0),
    }
end

return {
  s("def", function_body()),
  s(
    {
      trig = "@property",
      name = "property",
      dscr = "propertyを展開する"
    },
    {
      t(
        {
          "@property",
          ""
        }
      ),
      unpack(function_body()),
    }
  ),
  s(
    {
      trig = "@cached",
      name = "cached_property",
      dscr = "cached_propertyを展開する"
    },
    {
      t(
        {
          "@cached_property",
          ""
        }
      ),
      unpack(function_body()),
    }
  ),
  s(
    {
      trig = "dc",
      name = "dataclass",
      dscr = "dataclassを展開する"
    },
    {
      t({
        "@dataclass",
        "class "
      }),
      i(1, "ClassName"),
      t({":","    "}),
      i(2, "field: int"),
      i(0),
    }
  ),
  s(
  {
    trig = "fdc",
    name = "frozen dataclass",
    dscr = "dataclass(frozen=True, slots=True)を展開する"
  },
  {
    t({
      "@dataclass(frozen=True, slots=True)",
      "class "
    }),
    i(1, "ClassName"),
    t({":", "    "}),
    i(2, "field: int"),
    i(0),
  }
),
}
