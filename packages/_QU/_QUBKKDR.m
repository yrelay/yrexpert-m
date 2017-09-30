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

;%QUBKKDR^INT^1^59547,73884^0
%QUBKKDR ;;02:46 PM  10 Feb 1992; ; 27 Jul 93  5:00 PM
 
 
 
 S ^TOLISRAM($I,100)=$S($D(^TOLISRAM($I,10)):^TOLISRAM($I,10),1:"~"_$$GETLBLAN^%VTLBLAN($P($T(HEAD),";;",2)))
LOOP D ^%VCLEVAR S %PROGEX=$P(^TOLISRAM($I,100),"~",2) G:%PROGEX="" FIN D @%PROGEX S %TETPIL=$P(^TOLISRAM($I,100),"~",2) I %TETPIL=%PROGEX S ^TOLISRAM($I,100)="~"_$P(^TOLISRAM($I,100),"~",3,299)
 G LOOP
FIN Q
HEAD ;;MENU^%QUBKKDR
 
 
MENU 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;SAISIES MULTIPLES
 ;;#ajout de saisies# d'attribut;;CLEPAG^%VVIDEO,^%VAJOUT("QUBKGR"),CLEPAG^%VVIDEO,ALL^%QUBKKV
 ;;#cms de saisies# d'attribut;;CLEPAG^%VVIDEO,^%VCMS("QUBKGR"),CLEPAG^%VVIDEO,ALL^%QUBKKV
 ;;#validation# d'une saisie;;^%QUBKKV
 ;;#activation# de saisie d'attribut;;^%QUBKKA	
 
FUNC ;;
 ;;ajout de saisie d'attibuts pour des individus
 ;;cms de saisie d'attibuts pour des individus
 ;;verification de la validite d'une saisie et preparation pour l'execution
 ;;saisie d'attributs sur une liste d'individus	
 ;;
 ;;

