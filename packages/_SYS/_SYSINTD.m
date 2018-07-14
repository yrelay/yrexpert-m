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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SYSINTD^INT^1^59547,73892^0
SYSINTD(GLO) 
 
 
 
 
 
 
 
 
 
 
 S X0="F %U=1:1 Q:'$D(^ROUTINE(""tl""_%U))  ZR  ZS @(""tl""_%U)" X X0
 S %N=0,NP=0
 D ^%VZEATT
 F %ZZ=0:1 S TAB=$P($T(TAB+%ZZ),";;",2) Q:TAB=""  D ADR^%QCAGLC("^["""_QUI_"""]"_GLO_"("""_TAB_"""","^"_GLO_"("""_TAB_"""") S GL="^"_GLO_"("""_TAB_"""",PREF="tl",NP=NP+1 D TR S GL=GL_")" K @(GL)
 D FIN
 Q
TAB ;;ETUDE.EQX
 
TR S NBL=0,X0="ZR  ZI PREF_NP_"" ;;"" X X1"
 S X1="S T=GL_"","""""""")"""
 S X1=X1_" F %U=1:1 S T=$ZO(@T) S:T'="""" VN=@T S %=(T=""""!(T[""^ROUTINE(""""tl"")) X:% X2 Q:%  W !,T S %N=%N+1 S LI="" ;;""_T_""=""_VN ZI LI S NBL=NBL+1"
 S X1=X1_" I NBL>30 S NBL=0 ZS @(PREF_NP) S NP=NP+1 ZR  ZI PREF_NP_"" ;;""",X2="ZS @(PREF_NP)"
 X X0 Q
 
FIN 
 S X0="ZL tl1 ZR +1 ZI ""tl1 ;;""_NP_"";""_%N ZS tl1"
 X X0 D ZD^%QMDATE4 S DAT=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1)
 F %U=1:1:NP S ^PROGMOD(DAT,"tl"_%U)=1
 Q
 
 
GLOB(LISTE) 
 S X0="F %U=1:1 Q:'$D(^ROUTINE(""tl""_%U))  ZR  ZS @(""tl""_%U)" X X0
 S %N=0,NP=0,GLO=""
 D ^%VZEATT
 F %Z=0:0 S GLO=$O(@LISTE@(GLO)) Q:GLO=""  S TAB="" F %ZZ=0:0 S TAB=$O(@LISTE@(GLO,TAB)) Q:TAB=""  D ADR^%QCAGLC("^["""_QUI_"""]"_GLO_"("""_TAB_"""","^"_GLO_"("""_TAB_"""") S GL="^"_GLO_"("""_TAB_"""",PREF="tl",NP=NP+1 D TR S GL=GL_")" K @(GL)
 D FIN
 Q
 
 
RESTOR 
 D MSG^%VZEATT($$^%QZCHW("Restoration des donnees"))
 D INT^%DIR
 S RETOUR=%DIR
 S HOST=$$TABID^%INCOIN("ORDINATEUR")
 I HOST="" D ^%VZEAVT($$^%QZCHW("Veuillez definir l'utilisateur")) Q
 S NB=0,$ZT="G LOP"
 S Y0="ZL tl1 S LIM=+$P($P($T(+1),"";;"",2),"";"",1),%N=+$P($P($T(+1),"";;"",2),"";"",2)"
 S X0="ZL @(""tl""_I) F J=2:1 S LI=$T(+J) Q:LI=""""  S LI=$P(LI,"";;"",2,500),RF=$P(LI,""="",1),VL=$P(LI,""="",2,500) D ADR^%QCSCDIR(HOST,QUI) S @RF=VL,NB=NB+1 D ADR^%QCSCDIR(HOST,RETOUR)"
 S I=0 X Y0
LOP S I=I+1 G:I>LIM END X X0 G LOP
END I NB'=%N W !,"Probleme de recuperation..."
 Q:'($D(^ROUTINE("tlLIST")))
 D MSG^%VZEATT($$^%QZCHW("Reanalyse des traitements"))
 
 S X1="ZL @(""tlLIST"") F J=2:1 S TRT=$T(+J) Q:TRT=""""  S TRT=$P(TRT,"";;"",2) S RES=$$^%TLIANAL(TRT,0)"
 X X1
 Q

