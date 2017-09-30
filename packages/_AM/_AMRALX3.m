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

;%AMRALX3^INT^1^59547,73865^0
%AMRALX3 ;;09:44 AM  4 Aug 1993;
ETQ30 
 S SKEL=SKEL+1,^PARASOR($J,%VNGA,"SKEL",SKEL)="ATTRIBUT.TEMPORAIRE",^PARASOR($J,%VNGA,"TRAD",SKEL)=MOT
C80 
 G ETQ4^%AMRALX0
C81 G ECHEC^%AMRALX0
ETQ31 
C82 
 I $$VERBE^xatanlex(MOT)=0 G C83^%AMRALX3
 G ETQ37^%AMRALX3
C83 
 G ETQ17^%AMRALX1
C84 G ECHEC^%AMRALX0
ETQ32 
 S SKEL=SKEL+1,^PARASOR($J,%VNGA,"SKEL",SKEL)="COMMENT",^PARASOR($J,%VNGA,"TRAD",SKEL)=MOT
C85 
 G ETQ7^%AMRALX1
C86 G ECHEC^%AMRALX0
ETQ33 
 S MOT=MOT_""""
C87 
 G ETQ19^%AMRALX1
C88 G ECHEC^%AMRALX0
ETQ34 
 S SKEL=SKEL+1
 S ^PARASOR($J,%VNGA,"SKEL",SKEL)="CONSTANTE.ALPHA"
 S ^PARASOR($J,%VNGA,"TRAD",SKEL)=MOT
C89 
 G ETQ4^%AMRALX0
C90 G ECHEC^%AMRALX0
ETQ35 
 S SKEL=SKEL+1
 S ^PARASOR($J,%VNGA,"SKEL",SKEL)=MOT
 S ^PARASOR($J,%VNGA,"TRAD",SKEL)=MOT
C91 
 G ETQ4^%AMRALX0
C92 G ECHEC^%AMRALX0
ETQ36 
C93 
 I $$OKLEX^xatanlex(MOT)=0 G C94^%AMRALX3
 G ETQ38^%AMRALX3
C94 
 G ETQ17^%AMRALX1
C95 G ECHEC^%AMRALX0
ETQ37 
 S SKEL=SKEL+1,^PARASOR($J,%VNGA,"SKEL",SKEL)="VERBE",^PARASOR($J,%VNGA,"TRAD",SKEL)=MOT
C96 
 G ETQ4^%AMRALX0
C97 G ECHEC^%AMRALX0
ETQ38 
 S SKEL=SKEL+1
 S ^PARASOR($J,%VNGA,"SKEL",SKEL)="ATTRIBUT"
 S ^PARASOR($J,%VNGA,"TRAD",SKEL)=MOT
C98 
 G ETQ4^%AMRALX0
C99 G ECHEC^%AMRALX0

