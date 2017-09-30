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

;%QSTEXTE^INT^1^59547,73883^0
QSTEXTE(ACT,XG,YH,DH,DV,BASE,IND,ATT,VAL,ORD,GLO,AFF) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %G,%T,DUP,G,GL,LIGN,T,TY,TYP,SAIDIR,INDI
 G:ACT="S" SUPP G:ACT="C" AFFI G:ACT="M" MOD G:ACT="I" SAISS
 
SAIS 
 
 
NQ I '($$AIR^%QSGEST5(BASE,IND,ATT)) S ORD=1 G SAISS
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Attribut deja existant...est-il multivalue ? : "),"O")'=1 D ^%VZEAVT($$^%QZCHW("Dans ce cas, veuillez le modifier")),FIN("","") S AFF=1 Q
 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("No d'ordre : "))
 I CTRLA D FIN("","") Q
 S:Y1="" Y1=1
 I $$OAIR^%QSGE5(BASE,IND,ATT,Y1) D ^%VZEAVT($$^%QZCHW("Numero d'ordre existant")),FIN("","") S AFF=1 Q
 S ORD=Y1
SAISS D UN^WPADED(.VAL) I VAL="" D FIN("","") S AFF=3 Q
 D FIN(VAL,ORD)
 S:ACT="A" GLO("AJ",ATT,ORD)=VAL
 S:ACT="I" GLO("MOD",ATT,ORD)=VAL
 S AFF=3
 Q
MOD 
 
 
 G:VAL="" SAIS
 D CLEPAG^%VVIDEO,ADDED^WPADED(VAL)
 D FIN(VAL,ORD)
 S AFF=3 Q
 
SUPP 
 
 
 I VAL="" D ^%VSQUEAK S AFF=0 Q
 S AFF=1,DX=XG,DY=23 X XY
 D POCLEPA^%VVIDEO G:$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression du texte ")_VAL_$$^%QZCHW(" d'indice ")_ORD_" ?")'=1 FINS
 I ORD="" S ORD=1
 S GLO("SUP",ATT,ORD)=VAL
FINS D FIN(VAL,ORD) Q
 
AFFI 
 
 
 D CLEPAG^%VVIDEO,ADDED^WPADED(VAL)
 D FIN(VAL,ORD)
 S AFF=3 Q
 
FIN(V,O) 
 S VAL=V,ORD=O Q

