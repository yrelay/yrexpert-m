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

;%QSNUPV2^INT^1^59547,73882^0
%QSNUPV2(A,LD,B,N,C,FC) 
 
 
 
 
 
 
 
 
 
 
 
 
 N AT,CH,E,BID,NN,NT,O,%O,OK,V,%V,NCH,FC2,L,ARRET,OKECR
 S $ZT=""
 S OKECR=$$GET^%SGVAR("ECR")
 W:OKECR "="
 S NT=0,NN=@N,AT=$O(@N@("")),CH="",ARRET=0
 
B1 S CH=$O(@N@(AT,CH))
 G:CH="" F1
 S L=$L(AT),NCH=""""_$$ZSUBST^%QZCHSUB(CH,"""","""""")_""""
 S NT=NT+1,FC2=FC D SUBST
 Q:ARRET=1 0
 S @("OK="_FC2)
 W:((NT#10)=0)&OKECR "*"
 I '(OK) K @N@(AT,CH) S NN=NN-1
 G B1
F1 
 S @N=NN
 I NN=0 S C=0 Q 1
 
 W:OKECR "U"
 S NN=0,NT=0
 S CH="" F %V=0:0 S CH=$O(@N@(AT,CH)) Q:CH=""  S O="" F %O=0:0 S O=$O(@N@(AT,CH,O)) Q:O=""  S NT=NT+1 W:((NT#100)=0)&OKECR "%" S ^[QUI]RQS3($J,B,FC,"OBJET",O)="",NN=NN+1
 S C=NN Q 1
 
SUBST N IS,LF,P1,P2
 S IS=1
BOUC S IS=$F(FC2,AT,IS) Q:IS=0
 G:$$MAUVAIS BOUC
 S LF=$L(FC2)
 S P1=$S((IS-L)>1:$E(FC2,1,(IS-L)-1),1:"")
 S P2=$S(IS>LF:"",1:$E(FC2,IS,LF))
 I (($L(P1)+$L(P2))+$L(NCH))>500 S ARRET=1 Q
 S FC2=P1_NCH_P2
 S IS=(IS+$L(NCH))-L
 G BOUC
MAUVAIS() Q:"<>'!#()_-+=*[]&/\"[$E(FC2,IS) 0
 Q 1

