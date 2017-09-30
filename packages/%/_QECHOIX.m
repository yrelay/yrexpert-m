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

;%QECHOIX^INT^1^59547,73875^0
%QECHOIX ;
 ;; primitives de gestion de liens generalises
 ;; temporaires ou liens de dkbms
 
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,2,0,0," contraintes de precedence ")
 S DX=10,DY=10 X XY W " nom de la liste :" R LISTIND G FIN:LISTIND=""
 I $$GETLBLAN^%VTLBLAN(LISTIND)="?" S LISTIND=$$UN^%PKCHOIX($$LISTIND^%QSGEST6("L0"),10,12,8)
 G:LISTIND="" FIN
 S NOMLIEN="PRECEDE",REP="MOZOP"
 S L=$$STO^%QSGES11(LISTIND)
 D ADR^%QEPRIM(REP,NOMLIEN)
 S CREATION=0
 S GPL=$$STO^%QSGES11(LISTIND)
BCPL D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,2,0,0," contraintes de precedence ")
 S DX=10,DY=10 X XY W " premiere operation :" R PL G FIN:PL=""
 I $$GETLBLAN^%VTLBLAN(PL)="?" S PL=$$UN^%PKCHOIX(GPL,10,12,8)
 G:PL="" FIN S INDC1=PL
 S DX=10,DY=10 X XY W " deuxieme operation :" R PL G BCPL:PL=""
 I $$GETLBLAN^%VTLBLAN(PL)="?" S PL=$$UN^%PKCHOIX(GPL,10,12,8)
 G:PL="" BCPL S INDC2=PL
TEST ;;
 
 S NOMLIEN="PRECEDE",REP="MOZOP"
 S L=$$STO^%QSGES11(LISTIND)
 D ADR^%QEPRIM(REP,NOMLIEN)
 
 
 D CRELIEN^%QEPRIM(REP,NOMLIEN,INDC1,INDC2)
 S CREATION=1
 G BCPL
 
 
FIN 
 Q:'(CREATION)
 D COUNT^%QEPRIM(REP,NOMLIEN)
 D TRANS^%QEPRIM(REP,NOMLIEN)
 Q
 ;
 ;

