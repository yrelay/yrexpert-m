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

;%QSNUPEV^INT^1^59547,73882^0
RQSNUPEV(A,LDE,B,N,C,FC) 
 
 
 
 
 
 
 
 
 
 
 
 
 S $ZT="" W "="
 N AT,CH,E,BID,NN,NT,O,%O,OK,V,%V,ATS,FC2,L,NCH
 S NT=0,NN=@N,AT=$O(@N@("")),CH=-1
 
 
B1 S CH=$N(@N@(AT,CH))
 G:CH=-1 F1
 S V=@N@(AT,CH)
 
 S ATS=AT_"/"_$$NOMLOG^%QSF(B)
 I $$TYPE^%QSGESPE(ATS)="DATE" S V=$$AFFI^%QMDAUC(B,AT,V)
 
 S FC2=FC,NCH=""""_$$ZSUBST^%QZCHSUB(V,"""","""""")_""""
 S NT=NT+1,L=$L(AT) D SUBST
 S @("OK="_FC2)
S1 W:(NT#10)=0 "*"
 I '(OK) K @N@(AT,CH) S NN=NN-1
 G B1
F1 
 S @N=NN
 I NN=0 S C=0 Q
 
 W "U"
 S NN=0,NT=0,V=""
 G:IND=0 SUIT
 F %V=0:0 S CH=$O(@N@(AT,CH)) Q:CH=""  S V=@N@(AT,CH),O="" F %O=0:0 S O=$$NXTRAVOI^%QSTRUC8(B,AT,V,IND,O) Q:O=""  S NT=NT+1 W:(NT#100)=0 "%" I $D(@LDE@(O)) S:'($D(^[QUI]RQS3($J,B,FC,"OBJET",O))) ^[QUI]RQS3($J,B,FC,"OBJET",O)="",NN=NN+1
 
 S C=NN Q
SUIT F %V=0:0 S CH=$O(@N@(AT,CH)) Q:CH=""  S V=@N@(AT,CH),I2="" F %I2=0:0 S I2=$$NXTRAVO^%QSTRUC8(B,AT,V,I2) Q:I2=""  D SUIT1
 
 S C=NN Q
 Q
SUIT1 S O="" F %O=0:0 S O=$$NXTRAVOI^%QSTRUC8(B,AT,V,I2,O) Q:O=""  S NT=NT+1 W:(NT#100)=0 "%" I $D(@LDE@(O)) S ^[QUI]RQS3($J,B,FC,"OBJET",O)="",NN=NN+1
 Q
SUBST N IS,LF
 S IS=1,LF=$L(FC2)
BOUC S IS=$F(FC2,AT,IS) Q:IS=0
 G:$$MAUVAIS BOUC
 
 S FC2=$S((IS-L)>1:$E(FC2,1,(IS-L)-1),1:"")_NCH_$S(IS>LF:"",1:$E(FC2,IS,LF)) G BOUC
MAUVAIS() Q:"<>'!#()_-+=*[]&/\"[$E(FC2,IS) 0
 Q 1

