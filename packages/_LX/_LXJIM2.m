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

;%LXJIM2^INT^1^59547,73870^0
LEXJIM2 ;
 
 
 
 
 
ECMOT 
 N GLOLEX
 S GLOLEX="^[QUI]TOLEX"
 G ECMOT3
 
ECMOT2(GLOLEX) 
 
ECMOT3 N LEXIQUE,TEMP,TITRE,TAB,MOTLEX,LMOT,NUMLIG,COLON
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LEXIQUE=$$CONCAS^%QZCHAD(TEMP,"LEXIQUE")
 U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("preparation en cours")," ",$$^%QZCHW("(""."" = page)")
 S TITRE(1)=$$^%QZCHW("LEXIQUE")_" "_WHOIS_", "_$$^%QZCHW("vue")_" "_$$^%QZCHW(QUANTITE)_", "_$$^%QZCHW(MOTMODE)
 S:QUANTITE=$$^%QZCHW("partielle") TITRE(1)=TITRE(1)_", "_$$^%QZCHW("de")_" "_MOT1_" "_$$^%QZCHW("a")_" "_MOT2
 D ECMSEUL:MOTMODE=$$^%QZCHW("mots seuls"),ECMDET:MOTMODE=$$^%QZCHW("detaillee")
 S TITRE(1)=TITRE(1)_" ( "_NBMOTS_" "_$$^%QZCHW("mots")_" )"
 
 I IMPR'=$I D POCLEPA^%VVIDEO W $$^%QZCHW("impression en cours")
 I IMPR=$I D ^%VZEAVT($$^%QZCHW("terminee")),132^%VVIDEO:LLIGNE=132
 D IMP^%VPRINT(LEXIQUE,IMPR,NBLIGNE,LLIGNE,"TITRE")
 I IMPR=$I D ^%VZEAVT(""),80^%VVIDEO:LLIGNE=132
 K @(TEMP)
 Q
 
ECMDET 
 N TABI,MARGE,IBLANC,SYNLEX,LSYN,UNILEX,LUNI,COMLEX,ICOM,COM,LCOM,MESSYN,MESUNI,MESCOM,FOIS
 I IMPR'=$I G ECM2
 I DTM S LLIGNE=80
 E  D POCLEPA^%VVIDEO S LLIGNE=$$^%VZECH2($$^%QZCHW("nombre de colonnes d'affichage"),"132","80")
 D POCLEPA^%VVIDEO W $$^%QZCHW("preparation en cours")," ",$$^%QZCHW("(""."" = page)")
ECM2 
 S TAB=26,TABI=$S(LLIGNE<100:5,1:TAB),MOTLEX=MOT1,NUMLIG=1
 S MESSYN=$$^%QZCHW("synonyme")_" : ",MESUNI=$$^%QZCHW("unite")_" : ",MESCOM=$$^%QZCHW("commentaires")_" : "
 S MARGE="" F IBLANC=1:1:TABI S MARGE=MARGE_" "
 
 S NBMOTS=0
 S:'($D(@GLOLEX@(MOTLEX))) MOTLEX=$O(@GLOLEX@(MOTLEX))
 F IMOT=1:1 D ECMD S MOTLEX=$O(@GLOLEX@(MOTLEX)) Q:((MOTLEX]MOT2)!(MOTLEX=""))!(MOTLEX="z")
 Q
ECMD 
 I QUANTITE'="mots reserves",$D(^[QUI]ZSYSMORE(MOTLEX)) Q
 S LMOT=$L(MOTLEX),@LEXIQUE@(NUMLIG)=MOTLEX,NBMOTS=NBMOTS+1
 I (LMOT<TAB)&(LLIGNE'<100) S COLON=TAB F IBLANC=LMOT+1:1:TAB S @LEXIQUE@(NUMLIG)=@LEXIQUE@(NUMLIG)_" "
 E  D SAUTL
 
 D ECMDSYN:$D(^[QUI]TOLEXS(MOTLEX)),ECMDUNI:$D(^[QUI]TOLEXU(MOTLEX)),ECMDCOM
 
 D SAUTL:COLON>0,SAUTL:LLIGNE<100
 Q
 
ECMDSYN 
 
 S SYNLEX=$O(^[QUI]TOLEXS(MOTLEX,""))
 S @LEXIQUE@(NUMLIG)=$S(COLON=0:MARGE,COLON>0:@LEXIQUE@(NUMLIG))_MESSYN_SYNLEX,COLON=$L(@LEXIQUE@(NUMLIG))
 
 F SYNLEX=$O(^[QUI]TOLEXS(MOTLEX,SYNLEX)) Q:(SYNLEX="")!(SYNLEX="z")  S LSYN=$L(SYNLEX) D:((COLON+LSYN)+2)>LLIGNE SOMARGE($L(MESSYN)) S @LEXIQUE@(NUMLIG)=@LEXIQUE@(NUMLIG)_", "_SYNLEX,COLON=(COLON+LSYN)+2
 D SAUTL
 Q
 
ECMDUNI 
 S UNILEX=$O(^[QUI]TOLEXU(MOTLEX,""))
 S @LEXIQUE@(NUMLIG)=$S(COLON=0:MARGE,COLON>0:@LEXIQUE@(NUMLIG))_MESUNI_UNILEX
 S:($D(^[QUI]TOLEXU(MOTLEX))#10)=1 @LEXIQUE@(NUMLIG)=@LEXIQUE@(NUMLIG)_", "_$$^%QZCHW("abreviation")_" : "_^[QUI]TOLEXU(MOTLEX)
 D SAUTL
 Q
 
ECMDCOM 
 S COMLEX=$P(^[QUI]TOLEX(MOTLEX),"^",1,5)
 S @LEXIQUE@(NUMLIG)=$S(COLON=0:MARGE,COLON>0:@LEXIQUE@(NUMLIG))_MESCOM,COLON=$L(@LEXIQUE@(NUMLIG))
 F ICOM=1:1:$L(COMLEX,"^") S COM=$P(COMLEX,"^",ICOM) I COM'="" D INSCOM
 D SAUTL
 Q
INSCOM 
 S COM=COM_" - ",LCOM=$L(COM)
 F FOIS=1:1 D:(COLON+LCOM)>LLIGNE INSC Q:(COLON+LCOM)'>LLIGNE
 S @LEXIQUE@(NUMLIG)=@LEXIQUE@(NUMLIG)_COM,COLON=COLON+LCOM
 Q
INSC 
 S @LEXIQUE@(NUMLIG)=@LEXIQUE@(NUMLIG)_$E(COM,1,LLIGNE-COLON),COM=$E(COM,(LLIGNE-COLON)+1,LCOM),LCOM=$L(COM)
 D SOMARGE($L(MESCOM))
 Q
 
SAUTL 
 S NUMLIG=NUMLIG+1,@LEXIQUE@(NUMLIG)="",COLON=0
 W:(NUMLIG#NBLIGNE)=0 "."
 Q
 
SOMARGE(NBLANC) 
 N MARGESUP
 S MARGESUP="" F IBLANC=1:1:NBLANC S MARGESUP=MARGESUP_" "
 S NUMLIG=NUMLIG+1,@LEXIQUE@(NUMLIG)=MARGE_MARGESUP,COLON=$L(MARGE)+NBLANC
 W:(NUMLIG#NBLIGNE)=0 "."
 Q
 
ECMSEUL 
 N FORMAT,TABMOT,ERREUR
 S FORMAT="MISENP"
 N @(FORMAT)
 S TAB=40,LLIGNE=TAB*(LLIGNE\TAB)
 S @FORMAT@("L")=LLIGNE,@FORMAT@("S")="   "
 S MOTLEX=MOT1,NUMLIG=1,COLON=0,NBMOTS=0
 S:'($D(@GLOLEX@(MOTLEX))) MOTLEX=$O(@GLOLEX@(MOTLEX))
 F IMOT=1:1 D ECMS S MOTLEX=$O(@GLOLEX@(MOTLEX)) Q:((MOTLEX]MOT2)!(MOTLEX=""))!(MOTLEX="z")
 
 S @LEXIQUE@(NUMLIG)=$$^%QZCHFO(FORMAT,.ERREUR)
 Q
ECMS 
 I QUANTITE'="mots reserves",$D(^[QUI]ZSYSMORE(MOTLEX)) Q
 S LMOT=$L(MOTLEX),NBMOTS=NBMOTS+1
 I (COLON+LMOT)>LLIGNE S @LEXIQUE@(NUMLIG)=$$^%QZCHFO(FORMAT,.ERREUR),NUMLIG=NUMLIG+1,COLON=0,IMOT=1 K @FORMAT@("D") W:(NUMLIG#NBLIGNE)=0 "."
 S TABMOT=TAB+(TAB*(((LMOT-1)+$L(@FORMAT@("S")))\TAB))
 S @FORMAT@("D",IMOT,"T")=TABMOT,COLON=COLON+TABMOT
 S @FORMAT@("D",IMOT,"D")=MOTLEX
 Q

