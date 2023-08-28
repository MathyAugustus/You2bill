<?
     
 
     function grabpagedata($purl)
     { 
         return(file_get_contents($purl));
     }
 
     function getpage($purl)
     {
         $purl = grabpagedata($purl);
         $pagecontent = $purl;
 
         return($pagecontent);
     }
 
     $urlvalue = $_REQUEST['url'];
         $fworkstring = getpage($urlvalue);
 
     for($i=1500;$i<=3000;$i++)
     {
 
         if(substr($fworkstring,$i,6) == '"t": "')
         {    
 
             $inicio = $i + 6;
             for($j=$inicio;substr($fworkstring,$j,1)<>'"';$j++)
             {    
                 $fim=  $j;
             }
 
             echo substr($fworkstring,$inicio,$fim-$inicio+1);
         }
 
     }
 
  
 
 ?>
