;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%EDCGRAP^INT^1^59547,73868^0
EDCGRAPH ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DEB N LG1,LG2,LG3,SAVX1,SAVX2,SAVY1,SAVY2,%9X,%9Y
 S $ZT="" S:'($D(%9EPA)) %9EPA=1E-2
 D SAVCOOR
 G CONT:$$^%QCAZG("%9TL")=""
 I %9TL="P" S LG1=2E-2,LG2=0,LG3=55E-3 G LIGNE
 I %9TL="M" S LG1=1,LG2=2E-1,LG3=1E-1 G LIGNE
 I %9TL="C" S LG1=2E-1,LG2=0,LG3=1E-1 G LIGNE
 I %9TL="L" S LG1=5E-1,LG2=0,LG3=1E-1 G LIGNE
 G LIGNE:(%9TL'="F")&(%9TL'="M")
CONT N X1,X2,Y1,Y2,%FONC
 S %9X1=$J(635E-5*%9X1,1,2),%9X2=$J(635E-5*%9X2,1,2),%9Y1=$J(%LIMYCM-(635E-5*%9Y1),1,2),%9Y2=$J(%LIMYCM-(635E-5*%9Y2),1,2)
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 S ENVL(%TERM,"X")=%9X2,ENVL(%TERM,"Y")=%9Y2
 G FIN
 
LIGNE 
 N TG,X,Y,X1,X2,Y1,Y2,DX2,DY2,DX3,DY3,DX,DY,SENSY,COS,SIN,SAVEPA,%FONC
 I $$^%QCAZG("AGR")="" N AGR S AGR=1
 S SENSY=1,SAVEPA=%9EPA,%9EPA=1E-2
 S %FONC="EPAISSEUR" D ^%PBPZ
 S X1=$J(635E-5*%9X1,1,2),X2=$J(635E-5*%9X2,1,2),Y1=$J(%LIMYCM-(635E-5*%9Y1),1,2),Y2=$J(%LIMYCM-(635E-5*%9Y2),1,2)
 
 I X1>X2 S X=X1,X1=X2,X2=X,Y=Y1,Y1=Y2,Y2=Y
 
 I Y2=Y1 S DY=0,DY2=0,DY3=0,DX=LG3,DX2=LG1,DX3=LG2,TG=0 G BOUCLE
 I Y1>Y2 S SENSY=-1
 
 I X2=X1 S DX=0,DX2=0,DX3=0,DY3=LG2,DY2=LG1,DY=LG3,TG=1 G BOUCLE
 S TG=(SENSY*(Y2-Y1))/(X2-X1)
 S COS=$$SQR^%TLCAMTH(1/(1+(TG*TG)))
 S SIN=$$SQR^%TLCAMTH((TG*TG)/(1+(TG*TG)))
 S DY=LG3*SIN,DX=LG3*COS
 S DY2=LG1*SIN,DX2=LG1*COS
 S DY3=LG2*SIN,DX3=LG2*COS
BOUCLE 
 I SENSY=1 G LIGNE2:(Y1>Y2)!(X1>X2)
 I SENSY=-1 G LIGNE2:(Y1<Y2)!(X1>X2)
 S %9X1=X1,%9Y1=Y1,%9X2=X1+DX2,%9Y2=Y1+(SENSY*DY2)
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 S X1=(X1+DX)+DX2,Y1=Y1+(SENSY*(DY+DY2))
 G:LG2=0 BOUCLE
 I SENSY=1 G LIGNE2:(Y1>Y2)!(X1>X2)
 I SENSY=-1 G LIGNE2:(Y1<Y2)!(X1>X2)
 S %9X1=X1,%9Y1=Y1,%9X2=X1+DX3,%9Y2=Y1+(SENSY*DY3)
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 S X1=(X1+DX)+DX3,Y1=Y1+(SENSY*(DY+DY3))
 G BOUCLE
LIGNE2 S ENVL(%TERM,"X")=X2,ENVL(%TERM,"Y")=Y2
 S %FONC="TAILLE" D ^%PBPZ
 S %9EPA=SAVEPA,%FONC="EPAISSEUR" D ^%PBPZ
 
FIN D RESCOOR
 Q
 
SAVCOOR 
 S SAVX1=%9X1,SAVY1=%9Y1,SAVX2=%9X2,SAVY2=%9Y2 Q
RESCOOR 
 S %9X1=SAVX1,%9Y1=SAVY1,%9X2=SAVX2,%9Y2=SAVY2 Q

