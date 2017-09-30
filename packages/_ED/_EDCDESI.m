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

;%EDCDESI^INT^1^59547,73868^0
EDCDESET(OBJ,VER,REP,IND,X,Y) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 I (OBJ="")!(VER="") Q
 N AGR,OR,R,NBASE,NIND,SAVTA,%DESSIN S OR=$$^%QCAZG("^V($J,""%"",""%ORIENTATION"",1)") S:OR="" OR="VERTICALE" S %DESSIN=1
 I IND="" S NBASE=BASE,NIND=OBJET G SUITE
 I ($E(IND,1)="%")&$D(CXT(IND)) S NBASE=CXT(IND,"BASE"),NIND=CXT(IND,"OBJET") G SUITE
 S NBASE=BASE,NIND=OBJET
SUITE I (NBASE="")!(NIND="") D ^%VZEAVT("Repertoire de "_IND_" inconnu ...") Q
 S AGR=$S($$^%QCAZG("^V($J,""%"",""%COEFFICIENT.AGRANDISSEMENT"",1)"):^V($J,"%","%COEFFICIENT.AGRANDISSEMENT",1),1:1)
 D XY^%EDCDESE(X,Y,.X,.Y) S R=$S(OR="HORIZONTALE":0,1:270)
 S SAVTA=^V($J,"%","%TAILLE",1) D ORIENT^%EDCDESS,COOR^%EDCENVL
 D ^%PBIED(OBJ,VER,NBASE,NIND,X,Y,AGR)
 S ^V($J,"%","%TAILLE",1)=SAVTA Q

