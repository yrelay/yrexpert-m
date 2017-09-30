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

;TOTRANSF^INT^1^59547,74876^0
TOTRANSF ;
 
 
 
 W *-1 D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Transfert du SAVOIR-FAIRE") D TO4^%VZCD S DX=0,DY=10 X XY W $$^%QZCHW("Transfert du SF de "),WHOIS,$$^%QZCHW(" vers : ") S DX=$X D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) G FIN
 I '($D(^TABIDENT(Y1,$$^%QZCHW("MACHINE")))) W " ???" H 3 G TOTRANSF
 S TO=^TABIDENT(Y1,$$^%QZCHW("MACHINE"))
 I TO=QUI D ^%VZEAVT($$^%QZCHW("Transfert impossible : meme partition de donnees")) G TOTRANSF
 W !,!,!,?10,$$^%QZCHW("1                   SF selectif ")
 W !,?10,$$^%QZCHW("2                   Abaques")
 W !,?10,$$^%QZCHW("3                   Lexique, tables conversion...")
 W !,!,?5,$$^%QZCHW("Attention ! si vous choisissez l'option numero 1,")," ",$$^%QZCHW("il vous faudra lancer une comprehension des articles copies"),"."
 
Q1 
 D POCLEPA^%VVIDEO
 W $$^%QZCHW("Votre choix : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN
 S OPI=Y1 G:(OPI<1)!(OPI>3) Q1 S GOP=OPI+1 D @GOP
 G FIN
 
2 
 S TIT=$$^%QZCHW("Transfert de Savoir-Faire") D ^TOGETAR2 Q:'($D(^COMPILVU($I)))  S DX=0,DY=5 D CLEBAS^%VVIDEO S DOM=-1
 S DOM="SAVOIR-FAIRE",TB=-1 G LTB
LDOM Q
LTB S TB=$N(^TOLISGLO(DOM,TB)) G:TB=-1 LDOM S ART=-1
LART S ART=$N(^COMPILVU($I,ART)) G:ART=-1 LTB
T01 S NOMTREE="^[QUI]"_$E(TB,1,8)_"("""_ART_"""",%TAD="COPY^TOTRANSF"
 K @("^[TO]"_TB_"(ART)")
 D ^%QCAGTW
 G LART
COPY S $ZT="ERR" W "." S %RS=@%T,T="^[TO]"_$P(%T,"]",2,999),@T=%RS Q
3 
 S TAB=$P($T(ABAC),";;",2)
21 K ^GLO($J) F %U=1:1 S TB=$P(TAB,",",%U) Q:TB=""  S ^GLO($J,$E(TB,1,8))=1
 S %TAD="COPYT^TOTRANSF",GLO=-1
LG S GLO=$N(^GLO($J,GLO))
 Q:GLO=-1
 S NOMTREE="^[QUI]"_GLO
 D KILL,^%QCAGTW
 G LG
4 
 S TAB=$P($T(TAB),";;",2) G 21
 
COPYT W "." S $ZT="ERR",%RS=@%T,T="^[TO]"_$P(%T,"]",2,999),@T=%RS Q
KILL S %U1=-1 F %U2=1:1 S %U1=$N(@NOMTREE@(%U1)) Q:%U1=-1  I %U1'="z" K @("^[TO]"_GLO_"(%U1)")
 Q
TABLETOT ;; TABLES TOTEM
TAB ;;ACOMMEB,EXPGIMP,CONSTANT,CPTEUR,TOLEX,TOLEXK,TOLEXS,TOSYNONY,CONVUNIT,RESTEST,PROBTEST,SYNTETUD
ABAC ;;SCRC,STRUCT,PRONUM,OCGRIL,OCUNIT
FIN Q
ERR G FIN

