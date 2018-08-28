function aparecerCaixa(){
            var fisico = document.getElementById("idFisico");
            var juridico = document.getElementById("idJuridico");
            var caixaFisico= document.getElementById("fisico");
            var caixaJuridico=document.getElementById("juridico");
            
            
            fisico.onclick=function(){ caixaFisico.style.display="block", caixaJuridico.style.display="none"};
            
            juridico.onclick=function(){caixaFisico.style.display="none", caixaJuridico.style.display="block"};
            
        }
        
        window.onload=function(){
            aparecerCaixa();
            
            
        }