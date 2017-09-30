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

;%TLIANAL^INT^1^59547,74029^0
%TLIANAL(TRT,TRACE,INTERACT,NBR) 
 
 
 
 
 
 
 
 
 
 
 
 
 N L,LPP,OK,CTRLA,ROUTREAF,RES,LP,ROUTREAF,LER,%PROVEN,RESCOMP
 S NBR=0,%PROVEN="TRT"
 S LER=$$^%QZCHW("Probleme sur la ligne no ")
 S OK=1,ROUTREAF="",LP=$$^%QCAZG("^[QUI]PBMANA(""TRAITEMENT"")")+1
 S CTRLA=0,RES=1,ROUTREAF=""
 D SIGNAL^%TLGEST(TRT)
 F L=1:1:$ZP(^[QUI]TTL(TRT,2,"")) S NBR=NBR+1 D TL I '(OK) D:'(INTERACT) ERREUR S RES=0,OK=1
 
 D SETANA^%TLGEST(TRT,RES)
 D MAJ^%TLGEST(TRT,0,1,RES)
 S ^[QUI]PBMANA("TRAITEMENT")=LP-1
 D KILLCOMP^%TLOGCMP(TRT)
 S RESCOMP=$$COMPTRT^%TLOCMP(TRT,0)
 Q RES
 
TL N ARBRE,POSIT,SX,SY,ATTP,ATTD,APPEX
 S (SX,SY)=0,POSIT=1
 W:TRACE !,$$^%QZCHW("Debut analyse ligne no : "),L
 W:TRACE !,?5,^[QUI]TTL(TRT,2,L)
 D:$D(^[QUI]TTL(TRT,2,L,"TETE")) KILL^%ANA(^[QUI]TTL(TRT,2,L,"TETE"))
 
 I $D(^[QUI]TTL(TRT,2,L,"NBR.ATTRIBUTS")) S ATTD=^[QUI]TTL(TRT,2,L,"NBR.ATTRIBUTS"),^[QUI]TTL(TRT,2,L,"NBR.ATTRIBUTS")=0 F I=1:1:ATTD K ^[QUI]TTL(TRT,2,L,"ATTRIBUT."_I)
 I $D(^[QUI]TTL(TRT,2,L,"NBR.APPELS")) S APPD=^[QUI]TTL(TRT,2,L,"NBR.APPELS"),^[QUI]TTL(TRT,2,L,"NBR.APPELS")=0 F I=1:1:APPD K ^[QUI]TTL(TRT,2,L,"APPEL."_I)
 S (ATTD,APPD,APPEX)=0
 D INIT2^%AN7(SX,SY)
 S OK=$$LIGN^%AN15(^[QUI]TTL(TRT,2,L),.POSIT,.ARBRE)
 I '(OK) W !,$$^%QZCHW("Erreur d'analyse en ligne "),L Q
 S ^[QUI]TTL(TRT,2,L,"TETE")=ARBRE D END^%AN7
 
 S ^[QUI]TTL(TRT,2,L,"NBR.ATTRIBUTS")=ATTD
 S ^[QUI]TTL(TRT,2,L,"NBR.APPELS")=APPD
 S ^[QUI]TTL(TRT,2,L,"NBR.APPELS.CALCULES")=APPEX
 N %c,ATTDI F I=1:1:ATTD S %c=$$LEX^%LXSTOCK(ATTD(I),.ATTDI) S:%c=0 ATTDI=ATTD(I) S:%c>1 ATTDI="ERREUR.LEXIQUE("_ATTD(I)_")" S ^[QUI]TTL(TRT,2,L,"ATTRIBUT."_I)=ATTDI
 F I=1:1:APPD S ^[QUI]TTL(TRT,2,L,"APPEL."_I)=APPD(I)
 Q
 
ERREUR G:'(RES) ERR2
 S ^[QUI]PBMANA("TRAITEMENT",LP)=TRT,LP=LP+1
 S ^[QUI]PBMANA("TRAITEMENT",LP)=$TR($J(" ",$L(TRT))," ","-"),LP=LP+1
ERR2 S ^[QUI]PBMANA("TRAITEMENT",LP)="   "_LER_L_" : "_^[QUI]TTL(TRT,2,L)
 S LP=LP+1
 Q

