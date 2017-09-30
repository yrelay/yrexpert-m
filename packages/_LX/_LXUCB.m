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

;%LXUCB^INT^1^59547,73871^0
LEXUCB ;
 
 
 
 
NUPAIMP S REFUSE=0 I RESUL(1)="" S REFUSE=1 G FIN
 I RESUL(IC)=$$^%QZCHW("SINON") G FIN
 S:'($D(^[QUI]CPTEUR("NUPAIMP",RESUL(1)))) ^[QUI]CPTEUR("NUPAIMP",RESUL(1))=0 L ^[QUI]CPTEUR("NUPAIMP",RESUL(1)) S PN=^[QUI]CPTEUR("NUPAIMP",RESUL(1)),PN=PN+1,^[QUI]CPTEUR("NUPAIMP",RESUL(1))=PN
 S TAB(IC)=PN,ICC=IC D AFFICHE L
 G FIN
 
NUPAMAT S REFUSE=0 I RESUL(1)="" S REFUSE=1 G FIN
 G:RESUL(IC)=$$^%QZCHW("SINON") FIN S:'($D(^[QUI]CPTEUR("NUPAMAT",RESUL(1)))) ^[QUI]CPTEUR("NUPAMAT",RESUL(1))=0 L ^[QUI]CPTEUR("NUPAMAT",RESUL(1)) S PN=^[QUI]CPTEUR("NUPAMAT",RESUL(1)),PN=PN+1,^[QUI]CPTEUR("NUPAMAT",RESUL(1))=PN
 S TAB(IC)=PN,ICC=IC D AFFICHE L
 G FIN
 
NUCOND S:'($D(^[QUI]CPTEUR("NUCOND"))) ^[QUI]CPTEUR("NUCOND")=0 L ^[QUI]CPTEUR("NUCOND") S PN=^[QUI]CPTEUR("NUCOND"),PN=PN+1,^[QUI]CPTEUR("NUCOND")=PN
 S TAB(IC)=PN,ICC=IC D AFFICHE L
 G FIN
 
AFFICHE D ^%VAFFICH Q
 
PARAVIDE S REFUSE=0 G:RESUL(IC)'="" FIN
 I IBMPC,(SCR="EXPLICI")!(SCR=$$^%QZCHW("IMPLICI")) S LIMITE=20 G SAUT
 I '(IBMPC),(SCR="EXPLICITE")!(SCR=$$^%QZCHW("IMPLICITE")) S LIMITE=20 G SAUT
 I ((SCR="IMPMAT")!(SCR="IMPMAC"))!(SCR="PHASE") S LIMITE=20 G SAUT
 S LIMITE=$S(SCR="FORMULE":21,SCR="IMPTRIP":19,SCR="NOMENC":20,SCR=$$^%QZCHW("MATIERE"):18,SCR="SELMAT":20,SCR="OUTCONS":21,SCR="TOCTREV":19,SCR="PEXPMACH":26,SCR="DIMOUT":22,1:IC)
SAUT F I1=IC:1:LIMITE S DEJALU(I1)=1,RESUL(I1)=""
 S (ICC,IC)=LIMITE,STOPUC=1 G FIN
 
EXIEX S REFUSE=0,ART=RESUL(1) I ART="" S REFUSE=1 G FIN
 I $D(AFRESU(IC)),AFRESU(IC)=RESUL(IC) G FIN
 S PARA=RESUL(IC) Q:PARA=""  S NUM=-1
 I IBMPC F WZ=0:0 S NUM=$N(^[QUI]EXPLICI(ART,NUM)) Q:NUM=-1  S PAREX=$N(^[QUI]EXPLICI(ART,NUM,-1)) I PAREX=PARA S REFUSE=1 D ^%VZEAVT($$^%QZCHW(""" ")_PARA_$$^%QZCHW(" "" est deja le libelle d'un parametre EXPLICITE : Libelle refuse !!")) G FIN
 I '(IBMPC) F WZ=0:0 S NUM=$N(^[QUI]EXPLICITE(ART,NUM)) Q:NUM=-1  S PAREX=$N(^[QUI]EXPLICITE(ART,NUM,-1)) I PAREX=PARA S REFUSE=1 D ^%VZEAVT($$^%QZCHW(""" ")_PARA_$$^%QZCHW(" "" est deja le libelle d'un parametre EXPLICITE : Libelle refuse !!")) G FIN
SYN G:^TOZE($I,"L")=0 FIN G:'($D(^[QUI]TOSYNONY(PARA))) SYNS S SYN=$N(^[QUI]TOSYNONY(PARA,-1)) G:SYN=-1 FIN D ^%VZEAVT($$^%QZCHW(""" ")_PARA_$$^%QZCHW(" "" est synonyme de ")_SYN_$$^%QZCHW(" ==> Substitution")) S LPA=$L(PARA),CHN=""
 F UU=1:1:LPA S CHN=CHN_$$^%QZCHW(" ")
 S ICC=IC,TAB(ICC)=CHN D AFFICHE S TAB(ICC)=SYN D AFFICHE G FIN
SYNS D:'($D(^[QUI]TOLEX(RESUL(IC)))) ^%LXUC7 S:'($D(^[QUI]TOLEX(RESUL(IC)))) REFUSE=1 G FIN
 
FIN K TAB Q
 ;
 ;

