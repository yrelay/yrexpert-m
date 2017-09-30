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

;%QMEXARA^INT^1^59547,73878^0
%QMEXARA ;;09:03 AM  11 Mar 1993; 22 Dec 92 10:40 AM ; 11 Mar 93  9:11 AM
 
 
 
 
 
 
OUT(FILE) 
 N LISTE,LISTATT,BASE,GLILA,LPF,LINVO,REPLIEN
 S BASE="RESEAU",LPF="ETAT.RESEAU",REPNODE="ETAT.RESEAU",LINVO="ETAT.PRECEDE"
 S REPLIEN=$$LIENI^%QSGEL3
 S LISTE=$$GEN^%QCAPOP("LTN"),BASE="RESEAU",LPF="ETAT.RESEAU",REPNODE="ETAT.RESEAU"
 D CREERL^%QS0XG1(LISTE,BASE,"^[QUI]ZLIGTRA("""_LISTE_""")","ARCHIVAGE","RESEAU")
 S ATN="" F %A=0:0 S ATN=$$NXTRI^%QSTRUC8(BASE,ATN) Q:ATN=""  D AJOUT^%QS0XG1(LISTE,ATN)
 S LISTATT=$$GEN^%QCAPOP("LTN")
 S GLILA(1)=LPF,GLILA(2)=LINVO
 D ADD^%QMLILA(LISTATT,"GLILA")
 S RES=$$ARCHIDON^%SGPDOU(LISTE,LISTATT,4,FILE,"reseaux de "_QUI)
 D ELIML^%QS0XG1(LISTE)
 D DEL^%QMLILA(LISTATT)
 Q
 ;

