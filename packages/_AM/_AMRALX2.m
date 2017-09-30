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

;%AMRALX2^INT^1^59547,73865^0
%AMRALX2 ;;09:44 AM  4 Aug 1993;
ETQ20 
 S MOT=MOT_CC
 S PT=PT+1
 S ^PARAENT($J,%VNGA+1,1)=CHAINE,^PARAENT($J,%VNGA+1,2)=PT
 D ZLECCAR^xatanlex(%VNGA+1)
 S CC=^PARASOR($J,%VNGA+1,1)
C54 
 I (($$CHIFFRE^xatanlex(CC)!$$LETTRE^xatanlex(CC))!(CC="."))=0 G C55^%AMRALX2
 G ETQ20^%AMRALX2
C55 
 G ETQ29^%AMRALX2
C56 G ECHEC^%AMRALX0
ETQ21 
 S MOT=MOT_CC
 S PT=PT+1
 S ^PARAENT($J,%VNGA+1,1)=CHAINE,^PARAENT($J,%VNGA+1,2)=PT
 D ZLECCAR^xatanlex(%VNGA+1)
 S CC=^PARASOR($J,%VNGA+1,1)
C57 
 I (($$CHIFFRE^xatanlex(CC)!$$LETTRE^xatanlex(CC))!(CC="."))=0 G C58^%AMRALX2
 G ETQ21^%AMRALX2
C58 
 G ETQ30^%AMRALX3
C59 G ECHEC^%AMRALX0
ETQ22 
 S MOT=MOT_CC
 S PT=PT+1
 S ^PARAENT($J,%VNGA+1,1)=CHAINE,^PARAENT($J,%VNGA+1,2)=PT
 D ZLECCAR^xatanlex(%VNGA+1)
 S CC=^PARASOR($J,%VNGA+1,1)
C60 
 I (($$CHIFFRE^xatanlex(CC)!$$LETTRE^xatanlex(CC))!(CC="."))=0 G C61^%AMRALX2
 G ETQ22^%AMRALX2
C61 
 G ETQ31^%AMRALX3
C62 G ECHEC^%AMRALX0
ETQ23 
 S MOT=MOT_CC
 S PT=PT+1
 S ^PARAENT($J,%VNGA+1,1)=CHAINE,^PARAENT($J,%VNGA+1,2)=PT
 D ZLECCAR^xatanlex(%VNGA+1)
 S CC=^PARASOR($J,%VNGA+1,1)
C63 
 I (CC="")=0 G C64^%AMRALX2
 G ETQ32^%AMRALX3
C64 
 G ETQ23^%AMRALX2
C65 G ECHEC^%AMRALX0
ETQ24 
 S PT=PT+1
C66 
 G ETQ3^%AMRALX0
C67 G ECHEC^%AMRALX0
ETQ25 
 S SKEL=SKEL+1,^PARASOR($J,%VNGA,"SKEL",SKEL)="OPERATEUR.BINAIRE",^PARASOR($J,%VNGA,"TRAD",SKEL)="'"_CC
C68 
 G ETQ24^%AMRALX2
C69 G ECHEC^%AMRALX0
ETQ26 
 S SKEL=SKEL+1,^PARASOR($J,%VNGA,"SKEL",SKEL)="OPERATEUR.UNAIRE",^PARASOR($J,%VNGA,"TRAD",SKEL)="'"
C70 
 G ETQ4^%AMRALX0
C71 G ECHEC^%AMRALX0
ETQ27 
 S PT=PT+1
 S ^PARAENT($J,%VNGA+1,1)=CHAINE,^PARAENT($J,%VNGA+1,2)=PT
 D ZLECCAR^xatanlex(%VNGA+1)
 S CC=^PARASOR($J,%VNGA+1,1)
C72 
 I (CC="""")=0 G C73^%AMRALX2
 G ETQ33^%AMRALX3
C73 
 G ETQ34^%AMRALX3
C74 G ECHEC^%AMRALX0
ETQ28 
 S MOT=MOT_CC
C75 
 G ETQ19^%AMRALX1
C76 G ECHEC^%AMRALX0
ETQ29 
C77 
 I $$MOTRES^xatanlex(MOT)=0 G C78^%AMRALX2
 G ETQ35^%AMRALX3
C78 
 G ETQ36^%AMRALX3
C79 G ECHEC^%AMRALX0

