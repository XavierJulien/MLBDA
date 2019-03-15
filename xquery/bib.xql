(: <bib>
{for $b in doc("bib.xml")//book[publisher = "Addison-Wesley"]
  return <book year="{$b/@year}">
         {$b/title}
         </book>}
</bib>   :) 
(: <results>
{for $b in doc("bib.xml")//book,
     $a in $b/author
  return <result>
         {$b/title}
         {$a}
         </result>
}
</results> :)

(: <results>
{for $b in doc("bib.xml")//book
  return <result>
         {$b/title}
         {$b/author}
         </result>
}
</results>  :)

<results>
{
for $a in doc("bib.xml")//author
  return <result>
          {$a}
          {$a/../title}
         </result> 
}
</results>