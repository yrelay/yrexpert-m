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
;! Nomprog     : %QULELOE                                                     !
;! Module      : EDITEUR DE LIEN                                              !
;! But         : Edition du graphe                                            !
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

%QULELOE ;
 
EXIETU(DEF,LETU) 
 N I,ET,EX,GLOET
 S GLOET=$$ADRETU
 S EX=0
 S ET="" F I=0:0 S ET=$O(@GLOET@(ET)) Q:ET=""  I @GLOET@(ET)=DEF S @LETU@(ET)="",EX=EX+1
 Q EX
 
NOUVET(DEFETU) 
 N GLOET,NUMET
 S GLOET=$$ADRETU
 S NUMET=$$GEN^%QCAPOP("EDL")
 S @GLOET@(NUMET)=DEFETU
 S @GLOET@(NUMET,"REPERTOIRE")=$P(DEFETU,$C(0))
 S @GLOET@(NUMET,"LIEN")=$P(DEFETU,$C(0),3)
 S @GLOET@(NUMET,"RACINE")=$P(DEFETU,$C(0),5)
 S @GLOET@(NUMET,"PORT")=$I
 Q NUMET
DEFETU(NUMET) 
 N GLOET,DEFETU S GLOET=$$ADRETU,DEFETU=@GLOET@(NUMET) Q DEFETU
 
CREERET(FORCE) N DEFETU,TABUTI
 S DEFETU=$$^%QULELO2("")
 Q:DEFETU="" ""
 S TABUTI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CR") K @(TABUTI)
 I '(FORCE),$$EXIETU^%QULELOE(DEFETU,TABUTI) S NUMET="" F %I=0:0 S NUMET=$O(@TABUTI@(NUMET)) Q:NUMET=""  I '($$CONFIRM^%PKUTIL(2,14,60,"etude existante ("_NUMET_"), recreer ?")) G CRF
 S NUMET=$$NOUVET(DEFETU)
 D SETETAT(NUMET,0)
CRF Q NUMET
 Q
LOADET(NUMET) Q
 
ACTIET(NUMET) 
 N RFR,GLOET
 S RFR=0
 S GLOET=$$ADRETU
 I $$GETETAT(NUMET)>0,$$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Rafraichissement de l'affichage ?")) S RFR=1,@GLOET@(NUMET,"PORT")=$I
 D ^%QULELO1(NUMET,"",RFR) Q
GLOCAR(NUMET) 
 N GLOET
 S GLOET=$$ADRETU
 Q $$CONCAS^%QZCHAD($$CONCAS^%QZCHAD(GLOET,NUMET),"C")
GLOEXEC(NUMET) 
 N GLOET
 S GLOET=$$ADRETU
 Q $$CONCAS^%QZCHAD($$CONCAS^%QZCHAD(GLOET,NUMET),"E")
SETETAT(NUMET,VAL) 
 N GLOET
 S GLOET=$$ADRETU
 S @GLOET@(NUMET,"E")=VAL
 Q
GETETAT(NUMET) 
 N GLOET,VAL
 S GLOET=$$ADRETU
 S VAL=$S($D(@GLOET@(NUMET,"E")):@GLOET@(NUMET,"E"),1:-1)
 Q VAL
SUPET(NUMET) 
 N GLOET
 S GLOET=$$ADRETU
 K @GLOET@(NUMET)
 Q
ADRETU() 
 Q "^[QUI]RQSDON(""QULEL"",""ETU"")"
 
 
 
MAKETB(TAB) 
 N LA,ATT,I,EX
 S @TAB@("TITRE")=$P($T(LIB),";;",2)
 S @TAB@("ENTETE")=$P($T(ENTETE),";;",2)
 F I=1:1 S EX=$P($T(LIB+I),";;",2),ATT=$P(EX,"/") Q:ATT="*"  S LA=$P(EX,"/",2),@TAB@(I,"ATT")=ATT,@TAB@(I,"LARG")=LA
 S @TAB@("NBC")=I-1
 Q
 
ENTETE ;;EDITEUR DE LIEN
LIB ;;     ETUDE       REPERTOIRE     LIEN          RACINE       PORT 
 ;;/12/
 ;;REPERTOIRE/16/
 ;;LIEN/16/
 ;;RACINE/16/
 ;;PORT/6/
 ;;*/

