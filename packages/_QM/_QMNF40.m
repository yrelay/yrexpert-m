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

;%QMNF40^INT^1^59547,73879^0
QMNF40 ;
 
 
 
 
 
INIT 
 N G,%I,CH
 S G=$$ADRES
 S @G@(1)="OUI"
 S @G@(2)=10
 S @G@(3)="COURANT"
 F %I=4:1:13 S @G@(%I)=""
 D POCLEPA^%VVIDEO
 S CH=$$^%VZECH2("Utilisation courante ? ","Nomenclature","Visualisation de reseau semantique")
 I $E(CH)="V" S @G@(9)="CONDITION.TRANSITION" Q
 S @G@(9)="QUANTITE"
 Q
 
CONFIG 
 N G,%I,ABENDSCR
 K RESUL
 S SCR="QMNFNO3",G=$$ADRES
 F %I=1:1:13 S RESUL(%I)=@G@(%I)
 D ^%VACTGRQ(SCR,.RESUL)
 I ABENDSCR S %ABORT=1 Q
 
 F %I=4:1:13 S @G@(%I)=RESUL(%I)
 
 S @G@(1)="OUI" I (RESUL(1)="N")!(RESUL(1)="NON") S @G@(1)="NON"
 S @G@(2)=RESUL(2)
 S @G@(3)="COURANT" I (RESUL(3)="A")!(RESUL(3)="AUTRE") S @G@(3)="AUTRE"
 Q
 
ADRES() 
 Q "^TEMPORAY(""B"",$I,""QMNF"")"

