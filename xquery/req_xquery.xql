(: for $p in //person 
where $p[@id = "person0"] 
return $p/name :)


(: for $a in //open_auctions/auction[position() <= 3] 
return <result id="{$a/@id}"> 
         {$a/initial} 
       </result> :)

(:for $a in //open_auctions/auction[position() <= 3] 
return <result id="{$a/@id}">
         <first>{$a/bidder[1]/increase/text()}</first>
         <last>{$a/bidder[last()]/increase/text()}</last>
       </result>
:)

(:for $a in //closed_auctions/auction[price >480] 
return $a/price :)

(: for $a in //regions/africa/item
  return $a/name :)
  
(: for $a in //regions/africa/item,
    $b in //closed_auctions/auction
    where $a/@id = $b/itemref/@item
  return <res>
         {$a/name}
         {$b/price}
         </res> :)
         
(: let $c := //people/person[not(exists(homepage))]
  return count($c) :)