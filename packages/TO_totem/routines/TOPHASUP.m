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

;TOPHASUP^INT^1^59547,74874^0
TOPHASUP ;
 
 S PHSUP="^PHASE($I,NUFA,TWREF)",(ARTI,YART,WB1)=YA,ADEL="PHASE",%TBP="^BLOCSUP($I,YA)" K @(PHSUP),^GLOETUPH($I,NUFA,TWREF),^UNKN($I),^PARINDEF($I),^REFLATER($I),^BLOCPHAS($I,NUFA,TWREF) S NUP=-1,NUNOM=0
LPH S NUP=$N(@%TBP@(NUP)) G:NUP=-1 END S RPH=@%TBP@(NUP),IIT=1 F IT="BLOC","OP","OG" S @IT=$P(RPH,"^",IIT),IIT=IIT+1
 S ABL=$P(BLOC,":",1),$P(@PHSUP@(YA,ABL,OG,OP),"^",25)=BLOC
TRAIT4 S %CAR=",",RS=$P(BLOC,":",2) D ^%QZCHNBC F WRE=1:1:%NBCAR+1 S PVIR=$P(RS,",",WRE),^BLOCPHAS($I,NUFA,TWREF,YA,ABL,OG,OP,WRE)=PVIR
 S RS=$P(BLOC,":",1),YAS=$S(RS["]":$P(RS,"]",2),1:RS),USER=$S(RS["]":$P($P(RS,"]",1),"[",2),1:"")
 S WHO=USER,USER=$S(USER="":QUI,1:$S($D(^TABIDENT(USER,$$^%QZCHW("MACHINE"))):^TABIDENT(USER,$$^%QZCHW("MACHINE")),1:QUI)),^BLOCPHAS($I,NUFA,TWREF,YA,ABL,OG,OP,0)=YAS_"|"_USER_"|"_WHO
 S NUEX=0,NOMBIS=0 F WWQ=0:0 S NUEX=$N(^BLOCPHAS($I,NUFA,TWREF,YA,ABL,OG,OP,NUEX)) Q:NUEX=-1  D TRAIT
 D EXNOM G LPH
TRAIT S EXP=^BLOCPHAS($I,NUFA,TWREF,YA,ABL,OG,OP,NUEX) D ^TOPARENT S XDP="("_EXP_")" D ^%ABRECPO,^TOPHAFOR,RECONS S ^BLOCPHAS($I,NUFA,TWREF,YA,ABL,OG,OP,NUEX)=EX
FIN Q
RECONS 
 I AEXEC=0 S EX="" G FIN
 S ITS=$N(T(-1)),IE=1,EX="" F WW=0:0 S IT=ITS,ITS=$N(T(IT)),EX=EX_T(IT) Q:ITS=-1  S:ITS'=(IT+1) EX=EX_VPOL(IE),IE=IE+1
 S LEX=$L(EX),EX=$E(EX,2,LEX-1)
 Q
EXNOM S WBI=""""_$I_""","""_NUFA_""","""_TWREF_""","""_YA_""","""_ABL_""","""_OG_""","""_OP_""""
 S NUNOM=NUNOM+1,^GLOETUPH($I,NUFA,TWREF,YA,"PHAS",NOMBIS,NUNOM)=WBI
 K WBI,%UI G FIN
END K AEXEC,EXP,IE,IT,ITS,LEX,NUEX,T,VPOL,WWQ Q

