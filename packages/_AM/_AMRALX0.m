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

;%AMRALX0^INT^1^59547,73865^0
%AMRALX0 ;;09:44 AM  4 Aug 1993;
 S %VNGA=1
 S %VNE(%VNGA,1)="ANALEX2"
 D EANALEX^%ATNUTI
 S %PILRET=$$INITLIFO^%SGUTIL
 D PUSHLIFO^%SGUTIL(%PILRET,"RETEXTER^%AMRALX0")
 G START^%AMRALX0
RETEXTER D KILLLIFO^%SGUTIL(%PILRET)
 D SANALEX^xatnuti
 Q
ECHEC 
 G @$$PMRKLIFO^%SGUTIL(%PILRET)
FIN G @$$PMRKLIFO^%SGUTIL(%PILRET)
START 
 D MRKLIFO^%SGUTIL(%PILRET)
ETQ1 
C1 
 G ETQ2^%AMRALX0
C2 G ECHEC^%AMRALX0
ETQ2 
 S CHAINE=^PARAENT($J,%VNGA,"CHAINE"),SKEL=0,PT=1
C3 
 G ETQ3^%AMRALX0
C4 G ECHEC^%AMRALX0
ETQ3 
 S ^PARAENT($J,%VNGA+1,1)=CHAINE,^PARAENT($J,%VNGA+1,2)=PT
 D ZLECCAR^xatanlex(%VNGA+1)
 S CC=^PARASOR($J,%VNGA+1,1)
C5 
 G ETQ4^%AMRALX0
C6 G ECHEC^%AMRALX0
ETQ4 
C7 
 I $$SEPAR^xatanlex(CC)=0 G C8^%AMRALX0
 G ETQ5^%AMRALX0
C8 
 I ((($A(CC)'<$A(0))&($A(CC)'>$A(9)))!(CC="."))=0 G C9^%AMRALX0
 G ETQ6^%AMRALX0
C9 
 I (CC="")=0 G C10^%AMRALX0
 G ETQ7^%AMRALX1
C10 
 I (CC="""")=0 G C11^%AMRALX0
 G ETQ8^%AMRALX1
C11 
 I (CC=" ")=0 G C12^%AMRALX0
 G ETQ9^%AMRALX1
C12 
 I $$LETTRE^xatanlex(CC)=0 G C13^%AMRALX0
 G ETQ10^%AMRALX1
C13 
 I (CC="%")=0 G C14^%AMRALX0
 G ETQ11^%AMRALX1
C14 
 I (CC="$")=0 G C15^%AMRALX0
 G ETQ12^%AMRALX1
C15 
 I (CC=":")=0 G C16^%AMRALX0
 G ETQ13^%AMRALX1
C16 
 I ("_*!/#\&<>"[CC)=0 G C17^%AMRALX0
 G ETQ14^%AMRALX1
C17 
 I ((CC="+")!(CC="-"))=0 G C18^%AMRALX0
 G ETQ15^%AMRALX1
C18 
 I (CC="'")=0 G C19^%AMRALX0
 G ETQ16^%AMRALX1
C19 
 G ETQ17^%AMRALX1
C20 G ECHEC^%AMRALX0
ETQ5 
 S SKEL=SKEL+1,^PARASOR($J,%VNGA,"SKEL",SKEL)=CC,^PARASOR($J,%VNGA,"TRAD",SKEL)=CC,PT=PT+1
C21 
 G ETQ3^%AMRALX0
C22 G ECHEC^%AMRALX0
ETQ6 
 S ^PARAENT($J,%VNGA+1,1)=CHAINE,^PARAENT($J,%VNGA+1,2)=PT
 D ZLECMOT^xatanlex(%VNGA+1)
 S MOT=^PARASOR($J,%VNGA+1,1),PT=^PARASOR($J,%VNGA+1,2)
C23 
 I $$NUM^%QZNBN(MOT)=0 G C24^%AMRALX0
 G ETQ18^%AMRALX1
C24 
 G ETQ17^%AMRALX1
C25 G ECHEC^%AMRALX0

