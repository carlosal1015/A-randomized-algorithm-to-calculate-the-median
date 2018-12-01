FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}