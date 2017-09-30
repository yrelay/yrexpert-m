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

;%AMRALX1^INT^1^59547,73865^0
%AMRALX1 ;;09:44 AM  4 Aug 1993;
ETQ7 
 S ^PARASOR($J,%VNGA,"OKLEX")=1,^PARASOR($J,%VNGA,"SKEL")=SKEL
 G @$$PMRKLIFO^%SGUTIL(%PILRET)
C26 G ECHEC^%AMRALX0
ETQ8 
 S MOT=""
C27 
 G ETQ19^%AMRALX1
C28 G ECHEC^%AMRALX0
ETQ9 
 S PT=PT+1
C29 
 G ETQ3^%AMRALX0
C30 G ECHEC^%AMRALX0
ETQ10 
 S MOT=""
C31 
 G ETQ20^%AMRALX2
C32 G ECHEC^%AMRALX0
ETQ11 
 S MOT=""
C33 
 G ETQ21^%AMRALX2
C34 G ECHEC^%AMRALX0
ETQ12 
 S MOT=""
C35 
 G ETQ22^%AMRALX2
C36 G ECHEC^%AMRALX0
ETQ13 
 S MOT=""
C37 
 G ETQ23^%AMRALX2
C38 G ECHEC^%AMRALX0
ETQ14 
 S SKEL=SKEL+1,^PARASOR($J,%VNGA,"SKEL",SKEL)="OPERATEUR.BINAIRE",^PARASOR($J,%VNGA,"TRAD",SKEL)=CC
C39 
 G ETQ24^%AMRALX2
C40 G ECHEC^%AMRALX0
ETQ15 
 S SKEL=SKEL+1,^PARASOR($J,%VNGA,"SKEL",SKEL)="OPERATEUR.BINAIRE.OU.UNAIRE",^PARASOR($J,%VNGA,"TRAD",SKEL)=CC
C41 
 G ETQ24^%AMRALX2
C42 G ECHEC^%AMRALX0
ETQ16 
 S PT=PT+1
 S ^PARAENT($J,%VNGA+1,1)=CHAINE,^PARAENT($J,%VNGA+1,2)=PT
 D ZLECCAR^xatanlex(%VNGA+1)
 S CC=^PARASOR($J,%VNGA+1,1)
C43 
 I (CC=" ")=0 G C44^%AMRALX1
 G ETQ16^%AMRALX1
C44 
 I (((CC="<")!(CC=">"))!(CC="="))=0 G C45^%AMRALX1
 G ETQ25^%AMRALX2
C45 
 G ETQ26^%AMRALX2
C46 G ECHEC^%AMRALX0
ETQ17 
 S ^PARASOR($J,%VNGA,"OKLEX")=0,^PARASOR($J,%VNGA,"SKEL")=0
 G @$$PMRKLIFO^%SGUTIL(%PILRET)
C47 G ECHEC^%AMRALX0
ETQ18 
 S SKEL=SKEL+1
 S ^PARASOR($J,%VNGA,"SKEL",SKEL)="CONSTANTE.NUMERIQUE"
 S ^PARASOR($J,%VNGA,"TRAD",SKEL)=MOT
C48 
 G ETQ3^%AMRALX0
C49 G ECHEC^%AMRALX0
ETQ19 
 S PT=PT+1
 S ^PARAENT($J,%VNGA+1,1)=CHAINE,^PARAENT($J,%VNGA+1,2)=PT
 D ZLECCAR^xatanlex(%VNGA+1)
 S CC=^PARASOR($J,%VNGA+1,1)
C50 
 I (CC="")=0 G C51^%AMRALX1
 G ETQ17^%AMRALX1
C51 
 I (CC="""")=0 G C52^%AMRALX1
 G ETQ27^%AMRALX2
C52 
 G ETQ28^%AMRALX2
C53 G ECHEC^%AMRALX0

