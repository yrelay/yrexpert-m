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
;! Nomprog     : %VZCAT                                                       !
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

%VZCAT ;
VVZCAT(TITRE,LONGLIG) 
 
 D IMPR(TITRE,LONGLIG)
 Q
 
INIT 
 S ALPHA=$$ALPHABET K @(ALPHA) Q
 
IMPR(TITRE,LONGLIG) 
 N ALPHA,C,CAR,CHAINE,I,MAXCAR
 S ALPHA=$$ALPHABET
 D ALFA(ALPHA)
 
 F I=1:1:9 S CHAINE(I)=""
 S:'($D(LONGLIG)) LONGLIG=80
 S MAXCAR=LONGLIG\11
 
 
 
 F C=1:1:$L(TITRE) S CAR=$E(TITRE,C) D CREER I (C#MAXCAR)=0 D DOIM W !,!
 D:CHAINE(1)'="" DOIM
 Q
CREER 
 
 F I=1:1:9 S CHAINE(I)=CHAINE(I)_"  "_@ALPHA@(CAR,I)
 Q
DOIM 
 
 F I=1:1:9 W CHAINE(I),! S CHAINE(I)=""
 Q
 
IMPRC(TITRE,LONGLIG) 
 D IMPR($$CTR^%VPRINT(TITRE,LONGLIG\11),LONGLIG)
 Q
ALFA(ALPHA) 
 D:'($D(@ALPHA)) ^%VZCAL1(ALPHA),^%VZCAL2(ALPHA),^%VZCAL3(ALPHA),^%VZCAL4(ALPHA)
 Q
TEST(LIGNE) 
 
 N ITEST,CHTEST
 
 S CHTEST=""
 F ITEST=32:1:122 S CHTEST=CHTEST_$C(ITEST)
 
 D IMPR(CHTEST,LIGNE) W !,!
 Q
 
TESTE 
 D TEST(80)
 Q
 
TESTI 
 N IMPR,TYPEIMPR,IMP
 
 S IMPR=$$TABID^%INCOIN("PRINTER")
 D PARAMS^%QCSAP(IMPR,.IMP)
 Q:'(IMP)
 S TYPEIMPR=IMP("SUB"),LIGNE=IMP("RM")
 O IMPR U IMPR
 
 D:TYPEIMPR="PK-DEC" BOLD^%EDCI350,DOUBLE^%EDCI350
 D:TYPEIMPR="P-LA75" BOLD^%EDCLA75,DOUBLE^%EDCLA75
 D TEST(LIGNE)
 
 D:TYPEIMPR="PK-DEC" DOUBLE2^%EDCI350,BOLD2^%EDCI350 W !
 D:TYPEIMPR="P-LA75" DOUBLE2^%EDCLA75,BOLD2^%EDCLA75
 W #
 
 C IMPR
 Q
ALPHABET() 
 Q "^TEMPORAY(""A"",""VVZCA"")"

