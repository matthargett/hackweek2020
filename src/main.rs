const T_SOURCE: &str = include_str!("./t.lua");

fn main() {
  let tokens = full_moon::tokenizer::tokens(T_SOURCE).unwrap();
  println!("{:#?}", full_moon::ast::Ast::from_tokens(tokens.clone()))
}
