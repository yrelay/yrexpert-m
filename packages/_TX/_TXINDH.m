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

;%TXINDH^INT^1^59547,74031^0
%TXINDH ;
 
 
 
 
 
 
 
 
 
 
 
 N %DS,DATP,DATH,NOJJ,FINSEM
 S DATP=$P(DAAT,"/",2)_"/"_$P(DAAT,"/",1)_"/"_$P(DAAT,"/",3),%DS=DATP
 D INT^%DATE S DATH=%DN,NOJJ=((DATH+3)#7)+1
DEBSEM 
 S DSEM=(%DN-NOJJ)+1,%DN=DSEM,DXINI=DATH-DSEM
 D GETDAT S DATD=DT
FINSEM 
 S FINSEM=(%DN-NOJJ)+8,%DN=FINSEM
 D GETDAT
 S DATF=$P(DT,"/",3)_$P(DT,"/",2)_$P(DT,"/",1)
DEBH 
 S HHD=DP_"00"
FINH 
 S HHF=(DP+5)_"59"
 Q
 
GETDAT D 400^%DO
 S DT=$P(%DS,"/",2)_"/"_$P(%DS,"/",1)_"/"_$P(%DS,"/",3) Q
 Q
 
HRV 
 N HRE,MIN,JNUM
 S PX=%KEEP("DX"),PY=%KEEP("DY"),HRE=((PX-10)\8)+DP,MIN=$S(((PX-10)#8)=0:"",1:(((PX-10)#8)\2)*15),HRDV=HRE_"H"_MIN,(%DN,JNUM)=(DSEM+(PY\2))-1
 D GETDAT
 S TAD=DT,DAY=$P("JEUDI^VENDREDI^SAMEDI^DIMANCHE^LUNDI^MARDI^MERCREDI","^",(JNUM#7)+1)
 
 Q:$L($P(HRDV,"H",1))'<2
 S HRDV="0"_HRDV Q
 
POS 
 N MC
 S HC=$P(HHC,"H",1),MC=$P(HHC,"H",2),PX=(((HC-DP)*8)+10)+((MC\15)*2)
 Q

