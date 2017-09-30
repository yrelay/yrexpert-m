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

;%QUBKV3^INT^1^59547,73884^0
%QUBKV3 ;;04:15 PM  31 Jan 1992; ; 20 Apr 93 10:21 AM
 
 
 
MOD 
 N CTRLA,CTR,PCX,PCY,YG,SLD,TAB
 S CTRLA=0
 S YG=$P(@A@(LIGCOUR),"^",COLCOUR)
 S TAB("DX")=@IN@("X")+2,TAB("DY")=(@IN@("Y")+@IN@("H"))-1,TAB("MSG")="Modification"
 S TAB("PCX")=XC,TAB("PCY")=YC
 S TAB("%LGX")=TAB("PCX")-2,TAB("%LDX")=TAB("%LGX")+@IN@("LI",COLCOUR,"L")
 I '(DTM) O 0:(RM:1)
 S Y1=""
 D MODIF^%VLECFLD(YG,"TAB",.CTR,.Y1)
 
 I CTR="A" G MOF
MUC 
 S REAF=0,OK=1
 I $D(@IN@("LI",COLCOUR,"U")) D @(@IN@("LI",COLCOUR,"U")_"(REF)") G:OK=0 MOF
 
 
 
MO2 S $P(@A@(LIGCOUR),"^",COLCOUR)=Y1
MOF I REAF=1 D AFF^%QUBKVA,MOVUPDW^%QUBKVR Q
 S DX=XC,DY=YC X XY W $J("",@IN@("LI",COLCOUR,"L"))
 X XY W $P(@A@(LIGCOUR),"^",COLCOUR)
 Q
 
 
MODD 
 N YG,PCX,PCY,CTRLA,SLD
 S YG=$C(X1),PCX=DX,PCY=YC X XY W YG
 D BEG^%VLEC I CTRLA!(Y1="") S REAF=0 G MOF
 G MUC
 
SUPPCH N Y1,REAF
 
 S REAF=0,Y1="" G MUC
 ;
 ;

