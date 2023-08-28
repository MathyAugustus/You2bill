integer i;

string param_um;

key http;

string corpo;

default
{
    state_entry()
    {
        llSay(0, "Hello, Avatar!");
        llListen(0,"","","");
        if (llKey2Name(llGetCreator()) != "Augustus Mathy")
        {
            state no_owner;
        }
    }
    
    listen(integer canal,string comando,key avkey,string mensagem)
    {

        if (llGetSubString(mensagem,0,llStringLength("/you2bill ") - 1) == "/you2bill ")
        {
            
            for(i=0;i<llStringLength(mensagem);i++) 
            {
             
                if (llGetSubString(mensagem,i,i+2) == "?v=")
                {
                    
                    param_um = llGetSubString(mensagem,i+3,llStringLength(mensagem)); 
                    
                }
                
            }
            
            http=llHTTPRequest("http://www.sanja.com.br/you2bill.php?url=" + llGetSubString(mensagem,llStringLength("/you2bill ") - 1,llStringLength(mensagem)), [] ,"");

            
        }
    }
    
    http_response(key id,integer status, list meta, string body)
    {
        if(http==id)
        {
            corpo = body;
            
            state play;
        }
    }

}

state no_owner
{
     state_entry()
     {
         llOwnerSay("no_owner");
         llSetTimerEvent(0.2);
     }   
  
    timer()
    {
        llSay(0,"Este script foi roubado!");
        llSay(0,"This script was stolen!");
    }  
}

state play
{
 
    state_entry()
    {
     
        llParcelMediaCommandList([PARCEL_MEDIA_COMMAND_STOP]);
        llParcelMediaCommandList([PARCEL_MEDIA_COMMAND_URL,"http://www.youtube.com/get_video?fmt=18&video_id=" + param_um + "&t=" + corpo]);
        llParcelMediaCommandList([PARCEL_MEDIA_COMMAND_PLAY]);   
           
    }       
    
}
