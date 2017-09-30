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

;%QSDESSI^INT^1^59547,73881^0
QSDESSI(ACT,XG,YH,DH,DV,BASE,IND,ATT,VAL,ORD,GLO,AFF) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N LIGN,TYP,SAID S AFF=1
 S LIGN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(LIGN)
 I ACT="I" G MODVAL
 I ACT="S" G SUP
 I ACT="M",VAL="?",'($$EXISTE(.VAL)) Q
 I ACT="M" G:(VAL="")!(ORD="") AJ
 I ACT="A" G AJ
 I '($$EXISTE(.VAL)) Q
 
 S VERSION=$$^%QSCALVA(BASE,IND,"VERSION")
 I VERSION'="" G CONFIRM
 S VERSION=$$VERSION(VAL)
 I VERSION="" G FIN
 G SUIT
CONFIRM 
 D POCLEPA^%VVIDEO
 S OK=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous changer la version")_" = "_VERSION,"N")
 I OK=-1 Q
 I OK=1 S VERSION=$$VERSION(VAL) I VERSION="" S AFF=2 Q
 I '($D(^[QUI]SDCOL(VAL,VERSION))) D ^%VZEAVT($$^%QZCHW("version inconnue")) S AFF=1 Q
SUIT I ACT="C" G CONS
 I ACT="M" G MOD
FIN 
 D:AFF'=1 @ROUTAFF
 Q
 
 
AJ 
 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("No d'ordre")_" : ","",1,RM-4,DY+1,DY-1,ROUTAFF,"",.CTR,.ORD)
 I CTR'="" Q
 S:ORD="" ORD=1
 I $$^%QSCALIN(BASE,IND,ATT,ORD)'="" D ^%VZEAVT($$^%QZCHW("Numero d'ordre deja existant")) G AJ
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Valeur")_" : ","",1,RM-4,DY+1,DY-1,ROUTAFF,"",.CTR,.VAL)
 I CTR'="" Q
 I '($$EXISTE(.VAL)) G FIN
 S VERSION=$$VERSION(VAL) G:VERSION="" FIN
 S GLO("AJ",ATT,ORD)=VAL
 G MOD
 
 
CONS 
 
 D CLEPAG^%VVIDEO,SCENE^%SDSCENE(VAL,VERSION,2) S AFF=2
 G FIN
 
MOD 
 
 D CLEPAG^%VVIDEO,SCENE^%SDSCENE(VAL,VERSION,2) S AFF=2
 S:ACT="I" GLO("MOD",ATT,ORD)=VAL
 G FIN
 
MODVAL 
 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Valeur")_" : ","",1,RM-4,DY+1,DY-1,ROUTAFF,"",.CTR,.VAL)
 I CTR'="" Q
 I '($$EXISTE(.VAL)) G FIN
 S VERSION=$$VERSION(VAL) G:VERSION="" FIN
 G MOD
 
SUP 
 
 D POCLEPA^%VVIDEO
 S OK=$$MES^%VZEOUI($$^%QZCHW("suppression de")_" "_ATT,"N")
 I OK'=1 Q
 S AFF=2,GLO("SUP",ATT,ORD)=VAL
 Q
 
MESS(LIB) 
 D MSG^%VZEATT(LIB)
 Q
 
INIT 
 S %PORT=$S($D(^TABIDENT(WHOIS,"ECRGRA")):^TABIDENT(WHOIS,"ECRGRA"),1:$I)
 S %TERM=$S($D(^TABIDENT(WHOIS,"TYPECR")):^TABIDENT(WHOIS,"TYPECR"),1:"PT-100G")
 Q
 
EXISTE(VAL) 
 Q:VAL="" 0
 I VAL="?" G COL
 I '($D(^[QUI]SDCOL(VAL))) D ^%VZEAVT($$^%QZCHW("collection inexistante")) Q 0
 Q 1
 
COL 
 D POCLEPA^%VVIDEO
 D INIT^%QUCHOIP("^[QUI]SDCOL",1,"",XG,YH,DH,DV)
 D AFF^%QUCHOIP
 S VAL=$$UN^%QUCHOIP,AFF=2
 D END^%QUCHOIP
 I VAL="" Q 0
 Q 1
 
VERSION(VAL) 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Version")_" : ","",1,RM-4,DY+1,DY-1,ROUTAFF,"$$UCONT^%QSDESSI",.CTR,.VERSION)
 Q VERSION
 
UCONT(Y1,REAF) 
 S REAF=0
 Q:Y1="" 0
 I Y1'="?" Q:'($D(^[QUI]SDCOL(VAL,Y1))) 0 Q 1
 D INIT^%QUCHOIP("^[QUI]SDCOL(VAL)",1,"",XG,YH,DH,DV)
 D AFF^%QUCHOIP
 S Y1=$$UN^%QUCHOIP,AFF=2
 D END^%QUCHOIP
 Q 1

