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

;%AMGRUCM^INT^1^59547,73865^0
%AMGRUCM ;;02:54 PM  25 Oct 1993;
 
 
 
 
INITRQS 
 K ^%RQSGLO("EXPLIC","TRT")
 
 S AA="ATTRIBUT",%AA=1
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"NBCLEFS")=4
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"CTRB",1)="$$LEXIQUE^%AMGRUC"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"TEXTE")="attribut"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",1)="Repertoire :"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",2)="Individu   :"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",3)="Attribut   :"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",4)="Indice     :"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.OBJET",%AA)=AA
 S AA="ATTRIBUT.TEMPORAIRE",%AA=%AA+1
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"NBCLEFS")=2
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"CTRB",1)="$$LEXIQUE^%AMGRUC"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"TEXTE")="temporaire"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",1)="Attribut   :"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",2)="Indice     :"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="INDIVIDU"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"NBCLEFS")=2
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"TEXTE")="individu"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",1)="Repertoire :"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",2)="Individu   :"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="VERBE"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"NBCLEFS")=1
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"TEXTE")="verbe"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",1)="Verbe :"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="LIEN"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"NBCLEFS")=3
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"TEXTE")="lien"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",1)="Lien       :"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",2)="Individu 1 :"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",3)="Individu 2 :"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="PREDICAT"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"NBCLEFS")=1
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"TEXTE")="predicat"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",1)="Predicat   :"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="LISTE"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"NBCLEFS")=1
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"TEXTE")="liste"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",1)="Liste   :"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="REPERTOIRE"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"NBCLEFS")=1
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"TEXTE")="repertoire"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",1)="Repertoire   :"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.OBJET",%AA)=AA
 S %AA=%AA+1,AA="ETUDE"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"NBCLEFS")=2
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"TEXTE")="etude"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",2)="Moteur   :"
 S ^%RQSGLO("EXPLIC","TRT","OBJET",AA,"DESCRIPTEUR",1)="Etude    :"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.OBJET",%AA)=AA
 
RR S %AA=1,AA="COND"
 S ^%RQSGLO("EXPLIC","TRT","REGLE",AA,"TEXTE")="condition"
 S ^%RQSGLO("EXPLIC","TRT","REGLE",AA,"GETGLO")="$$GLOC^%AMGRUC"
 S ^%RQSGLO("EXPLIC","TRT","REGLE",AA,"GETGLOET")="$$GLOCET^%AMGRUC"
 S ^%RQSGLO("EXPLIC","TRT","REGLE",AA,"AFFIVAL")="$$AFFIVAL^%AMGRUC"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.REGLE",%AA)=AA
 S %AA=%AA+1,AA="ACT"
 S ^%RQSGLO("EXPLIC","TRT","REGLE",AA,"TEXTE")="action"
 S ^%RQSGLO("EXPLIC","TRT","REGLE",AA,"GETGLO")="$$GLOA^%AMGRUC"
 S ^%RQSGLO("EXPLIC","TRT","REGLE",AA,"GETGLOET")="$$GLOAET^%AMGRUC"
 S ^%RQSGLO("EXPLIC","TRT","REGLE",AA,"AFFIVAL")="$$AFFIVAL^%AMGRUC"
 S ^%RQSGLO("EXPLIC","TRT","TOUCHE.REGLE",%AA)=AA
 
 
 S ^%RQSGLO("EXPLIC","TRT","ROUFEN")="ROUFEN^%AMGRUC"
 S ^%RQSGLO("EXPLIC","TRT","ROUFENRG")="FENREG^%AMGRUC"
 Q

