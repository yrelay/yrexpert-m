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

;%AD2^INT^1^59547,73865^0
%AD2 ;
 
 
 
 
 
INS 
 N MENU,OPT,LIB,ACT,SSM,PW,COM,ROUT,VAL,I,DOLI,SERV
 
 
 I ^[QUI]MN="NOK" D ^%VZEAVT($$^%QZCHW("Menus utilisateur incorrects ou non verifies.")) Q
 D ^%VZCDB($$^%QZCHW("INSTALLATION DES MENUS UTILISATEUR"),0),BLD^%VVIDEO W !,QUI D NORM^%VVIDEO
 
NET 
 S MENU=""
NETBCL S MENU=$O(^MN(MENU)) G:MENU="" TRANSF G:MENU="z" TRANSF
 D:'($D(^MN(MENU,"STATUT"))) INIT^%ADUTIL G:'($D(^MN(MENU,"STATUT"))) NETBCL
 I ^MN(MENU,"STATUT")=QUI K ^MN(MENU)
 G NETBCL
 
TRANSF 
 S MENU=""
 F I=1:1 S MENU=$O(^[QUI]MN(MENU)) Q:MENU=""  Q:MENU="z"  W "*" S ^MN(MENU,"TITRE")=$P(^[QUI]MN(MENU),"^",1),^MN(MENU,"STATUT")=QUI D OPTION
 
 
 
 S DOLI="" F I=0:0 S DOLI=$O(^GDERWH(DOLI)) Q:DOLI=""  S SERV=^GDERWH(DOLI) D KILM
 Q
KILM I '($D(^TABIDENT(SERV,"START"))) K ^GDERWH(DOLI) Q
 S MENU=^TABIDENT(SERV,"START") I $D(^[QUI]MN(MENU)) K ^GDERWH(DOLI)
 Q
 
OPTION 
 S OPT=""
 F I=1:1 S OPT=$O(^[QUI]MN(MENU,OPT)) Q:OPT=""  D INSTAL
 Q
INSTAL 
 S LIB=$P(^[QUI]MN(MENU,OPT),"^",1)
 S PW=$P(^[QUI]MN(MENU,OPT),"^",2)
 S ACT=$P(^[QUI]MN(MENU,OPT),"^",3)
 S TRT=$P(^[QUI]MN(MENU,OPT),"^",4)
 S LIS=$P(^[QUI]MN(MENU,OPT),"^",5)
 S SSM=$P(^[QUI]MN(MENU,OPT),"^",6)
 S COM(1)=$P(^[QUI]MN(MENU,OPT),"^",7)
 S COM(2)=$P(^[QUI]MN(MENU,OPT),"^",8)
 S COM(3)=$P(^[QUI]MN(MENU,OPT),"^",9)
 
 S COM=COM(1)_" "_COM(2)_" "_COM(3)
 S ^MN(MENU,OPT,"COM")=COM
 
 F I=1:1 S VAL(1)=$P($P($T(TEXT+I),";;",2),"/",1),VAL(2)=$P($P($T(TEXT+I),";;",2),"/",2) Q:VAL(1)=""  S:ACT=VAL(1) ROUT=VAL(2)
 I ACT="SOUS.MENU" S ROUT=SSM
 I ACT="ACTIVATION.TRAITEMENT" S ROUT="ACTIV2^%TLINTER("""_TRT_""","""_LIS_""")"
 I ACT="DEVELOPPEMENT.SPECIFIQUE" S ROUT="^"_SSM
 S ^MN(MENU,OPT)=LIB_"|"_ROUT_"|"_PW_"||"
 Q
 
RES 
 N MENU,NOINIT,NOACC,%S,SERV
 S SERV="" F %S=0:1 S SERV=$O(^TABIDENT(SERV)) Q:SERV=""  I $D(^TABIDENT(SERV,"START")) S MSTART=^TABIDENT(SERV,"START") I $D(^MN(MSTART,"STATUT")),^MN(MSTART,"STATUT")'="RESERVE" S NOACC(SERV)=""
 I $D(NOACC) D ^%VZEAVT($$^%QZCHW("Attention, certains services appellent des menus utilisateurs")) I $$CONFIRM^%VZEOUI("Confirmez-vous la restauration ?")<1 Q
 S MENU="",NOINIT=1
RESBC S MENU=$O(^MN(MENU)) Q:MENU=""  Q:MENU="z"
 I '($D(^MN(MENU,"STATUT"))),NOINIT D INIT^%ADUTIL S NOINIT=0
 I '($D(^MN(MENU,"STATUT"))) K ^MN(MENU) G RESBC
 I ^MN(MENU,"STATUT")'="RESERVE" K ^MN(MENU)
 G RESBC
RESFIN D ^%VZEAVT($$^%QZCHW("^MN restaure."))
 Q
ACTION 
 N VALLEG,ACT,TEMPO
 S REFUSE=0
 I RESUL(IC)="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Champ obligatoire")) Q
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 F I=1:1 S VALLEG=$P($P($T(TEXT+I),";;",2),"/",1) Q:VALLEG=""  S @TEMPO@(VALLEG)=""
 I RESUL(IC)="?" G SUIT1
 I '($D(@TEMPO@(RESUL(IC)))) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Action inconnue"))
 G SUIT2
SUIT1 D CHOIX(TEMPO)
 I ACT="" S REFUSE=1
 D REAF(ACT)
 K @(TEMPO)
SUIT2 I RESUL(IC)="ACTIVATION.TRAITEMENT" S PATOUCH(6)="",PATOUCH(7)="",PATOUCH(8)=1,RESUL(8)="" Q
 I (RESUL(IC)="SOUS.MENU")!(RESUL(IC)="DEVELOPPEMENT.SPECIFIQUE") S PATOUCH(6)=1,PATOUCH(7)=1,PATOUCH(8)="",RESUL(6)="",RESUL(7)="" Q
 F I=6:1:8 S PATOUCH(I)=1,RESUL(I)=""
 Q
CHOIX(GLO) 
 D INIT^%QUCHOIP(GLO,"",1,48,11,28,8),AFF^%QUCHOIP
 S ACT=$$UN^%QUCHOIP
 D END^%QUCHOIP,CLFEN^%VVIDEO(48,11,8,28)
 Q
REAF(VAL) 
 S TAB(IC)=VAL D ^%VAFFICH S RESUL(IC)=VAL Q
TEXT 
 ;;AJOUT.GAMME/^%MZGAM
 ;;CONSULTATION.GAMME/CMS^%MZGAM
 ;;GDX/^%EDDRIV
 ;;SAISIE.RAPIDE/^%SRDRIV
 ;;VISU.RAPIDE.ARBRE/VISU^%QMNF8
 ;;ACTIVATION.TRAITEMENT/ACTIV2^%TLINTER
 ;;ACTIVATION.HEVEA/^%QMECEVA
 ;;SOUS.MENU/
 ;;REPERTOIRES/AUTO^%QSAJCMS
 ;;INDIVIDUS/^%QSGBASE
 ;;MOZART/^%MZDRIVE
 ;;EDITION.FORMAT/^%EDC3
 ;;EDITION.MODELE/^%EDC1
 ;;DEVELOPPEMENT.SPECIFIQUE/
 ;;
 ;

