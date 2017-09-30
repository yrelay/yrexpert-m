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
;! Nomprog     : %TLDIALO                                                     !
;! Module      : TL (Traiements sur listes)                                   !
;! But         : Gestion des traitements sur listes                           !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!  Gestrion du dialogue suivant :                                            !
;!  creer  modifier  supprimer  activer  traiter select.  analyser  imprimer  !
;!  dupliquer  substituer  rechercher  compiler  mise au point arbre          !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TLDIALO^INT^1^59547,74028^0
%TLDIALO() 
 
 
 
 
 
 
 
 
 N AD,CONTR,R,R2,TTLM,UC,TEMP,TTLM1,ICI,PORT
 S R=1,ICI="TLDIALO"
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TTLM=$$CONCAS^%QZCHAD(TEMP,"TTLM")
 D MENU^%TLDIAL3(TTLM)
DIAL S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,80,22,TTLM,.AD,.CONTR)
 I (CONTR="A")!(CONTR="F") S LISTOK=0 K @(TEMP) Q 1
 I AD'="" G @AD
 G DIAL
 
DIAL1 G:ICI="TLMENUG" DIAL1^%TLMENUG
 D:R2>0 POCLEPA^%VVIDEO D:R2=2 REAFF^%QS0DP S:R2>R R=R2 G DIAL
 
 
 
CREAT S R2=$$CREAT^%TLDIAL2 G DIAL1
 
 
 
DUPLI S R2=$$DUPLI^%TLDIAL2 G DIAL1
 
 
 
MODIF S R2=$$MODIF^%TLDIAL2 G DIAL1
 
 
 
ANAL S R2=$$ANAL^%TLDIAL2 G DIAL1
 
 
 
COMPIL S R2=$$COMPIL^%TLDIAL2 G DIAL1
 
 
 
SUPPR S R2=$$SUPPR^%TLDIAL2 G DIAL1
 
 
 
IMPRIM D ^%TLPRINT
 S R2=2 G DIAL1
 
 
 
MAPSF S R2=$$^%TLBAMAP G DIAL1
 
 
 
RECH S R2=$$RECH^%TLITEM G DIAL1
 
 
 
SUBST S R2=$$SUBST^%TLITEM G DIAL1
 
 
 
 
ACTIV2 S R2=$$RUNACT^%TLDIALA(1) G DIAL1
 
ACTIV S R2=$$RUNACT^%TLDIALA(0) G DIAL1
 
 
PLUS S R2=1 D PLUS^%QUAPAGM G DIAL1
MOINS S R2=1 D MOINS^%QUAPAGM G DIAL1
PAGE S R2=1 D PAGE^%QUAPAGM G DIAL1
REPER S R2=1 D REPER^%QUAPAGM G DIAL1
 
ARBRE D ALLTRT^%QULELT S R2=2 G DIAL1
 
MENU(TTLM) 
 G MENUT^%TLDIAL3

