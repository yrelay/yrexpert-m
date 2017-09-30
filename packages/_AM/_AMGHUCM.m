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

;%AMGHUCM^INT^1^59547,73865^0
%AMGHUCM ;;04:14 PM  10 Aug 1993;
 
 
 
 
 K ^%RQSGLO("EXPLIC","HEVEA")
 
 S %AA=1,AA="RESEAU"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"NBCLEFS")=1
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"CTRB",1)="$$EDITRES^%AMGHUC"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"TEXTE")="reseau"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",1)="reseau : "
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"ETUDE")=1
 S ^%RQSGLO("EXPLIC","HEVEA","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="ETAT"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"NBCLEFS")=2
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"CTRB",1)="$$EDITETAT^%AMGHUC"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"TEXTE")="etat"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",1)="reseau : "
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",2)="etat   : "
 S ^%RQSGLO("EXPLIC","HEVEA","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="TRANSITION"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"NBCLEFS")=3
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"CTRB",1)="$$EDITTRA^%AMGHUC"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"TEXTE")="transition"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",1)="reseau : "
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",2)="etat   : "
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",3)="etat   : "
 S ^%RQSGLO("EXPLIC","HEVEA","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="CONTEXTE"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"NBCLEFS")=2
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"CTRB",1)="$$EDITCXT^%AMGHUC"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"TEXTE")="contexte"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",1)="description : "
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",2)="cardinal    : "
 S ^%RQSGLO("EXPLIC","HEVEA","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="COURANT"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"NBCLEFS")=2
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"TEXTE")="courant"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",1)="repertoire courant : "
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",2)="individu courant  : "
 S ^%RQSGLO("EXPLIC","HEVEA","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="REGLE"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"NBCLEFS")=1
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"CTRB",1)="$$TLSAISI^%AMGHUC"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"TEXTE")="regle"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",1)="traitement : "
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"ETUDE")=1
 S ^%RQSGLO("EXPLIC","HEVEA","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="PREDICAT"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"NBCLEFS")=1
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"TEXTE")="predicat"
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"DESCRIPTEUR",1)="predicat : "
 S ^%RQSGLO("EXPLIC","HEVEA","OBJET",AA,"ETUDE")=1
 S ^%RQSGLO("EXPLIC","HEVEA","TOUCHE.OBJET",%AA)=AA
 S %AA=1,AA="REGLE"
 S ^%RQSGLO("EXPLIC","HEVEA","REGLE",AA,"TEXTE")="regle"
 S ^%RQSGLO("EXPLIC","HEVEA","REGLE",AA,"GETGLO")="$$GLO^%AMGHUC"
 S ^%RQSGLO("EXPLIC","HEVEA","REGLE",AA,"GETGLOET")="$$GLOET^%AMGHUC"
 S ^%RQSGLO("EXPLIC","HEVEA","REGLE",AA,"AFFIVAL")="$$AFFIVAL^%AMGHUC"
 S ^%RQSGLO("EXPLIC","HEVEA","TOUCHE.REGLE",%AA)=AA
 
 S ^%RQSGLO("EXPLIC","HEVEA","ROUFEN")="ROUFEN^%AMGHUC"
 S ^%RQSGLO("EXPLIC","HEVEA","ROUFENRG")="FENREG^%AMGHUC"
 Q

