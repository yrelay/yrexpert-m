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

;%DLCONST^INT^1^59547,73867^0
DLCONST ;
 
 
 
 
 N NF,NOMTAB,RESUL,SCR
 S NF=$ZP(^RQSMDL9("PLJ","GENERAL",""))+1
 D CLEPAG^%VVIDEO
 S SCR="DLCON"
 S RESUL(1)="PLJ",RESUL(2)="GENERAL",RESUL(3)=NF
 S RESUL(4)="ARTICLE",RESUL(5)="GAMME.MOZART",RESUL(6)="OPERATION.MOZART"
 S RESUL(7)="LANCEMENT",RESUL(8)="DELAI.OBTENU",RESUL(9)="DATE.JALON"
 S RESUL(10)="DUREE.JALON",RESUL(11)="DELAI.DEMANDE"
 S RESUL(12)="COMPOSE.DE"
 D ^%VAFIGRI,^%VAFISCR
 S ^RQSMDL9(RESUL(1),RESUL(2),RESUL(3))=RESUL(4)_"^"_RESUL(5)_"^"_RESUL(6)_"^"_RESUL(7)_"^"_RESUL(8)_"^"_RESUL(9)_"^"_RESUL(10)_"^"_RESUL(11)_"^"_RESUL(12)_"^"
 D ^%VZEAVT($$^%QZCHW("Veuillez verifier et installer la connexion standard"))
 Q

