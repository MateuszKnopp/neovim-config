local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- 1. ULTIMATE ERROR CHECK
  -- Wpisujesz "ier" -> Tab -> Bam!
  s("ier", {
    t("if err != nil {"),
    t({ "", "\treturn " }),
    i(1, "nil"), -- Tu ląduje kursor, domyślnie 'nil'
    t(", err"),
    t({ "", "}" }),
    i(0),
  }),

  -- 2. Szybki Printf z nową linią (debugowanie)
  -- Wpisujesz "pf" -> Tab
  s("pf", {
    t('fmt.Printf("'),
    i(1, "Log info"),
    t('\\n", '), -- Automatycznie dodaje \n, żebyś nie musiał pamiętać
    i(2, "vars"),
    t(")"),
  }),

  -- 3. Boilerplate dla nowego pliku (jeśli nie działa pkgm)
  s("pmain", {
    t("package main"),
    t({ "", "", 'import "fmt"' }),
    t({ "", "", "func main() {" }),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),
}
