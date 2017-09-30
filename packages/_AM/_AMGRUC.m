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

;%AMGRUC^INT^1^59547,73865^0
%AMGRUC ;;09:18 AM  5 Nov 1993;
 
 
 
 
QSATTRI(REP,IND,VAL) 
 D ^%QSATTRI(IND,REP,2,3,75,18)
 Q 1
LEXIQUE(R,IND,ATT,ORD,VAL) 
 N CL,ATR,REP,C,%C,NB,%R,IC
 S CL="",ATR=ATT,REP=$$NOMLOG^%QSF(R)
 D AS^%QMCAFF
 Q 1
 
 
ROUFEN S TYPE=$P(TX,$C(0),2)
 G:INST=0 PREMPAGE
 S DX=0,DY=1 X XY W "reseau",?12,$P(GEN,$C(0))
 S DX=0,DY=2 X XY W "etat",?12,$P(GEN,$C(0),2)
 S DX=0,DY=3 X XY W "traitement",?12,$P(GEN,$C(0),3)
 S DX=0,DY=4 X XY W "repertoire",?12,$P(GEN,$C(0),5)
 S DX=0,DY=5 X XY W "individu",?12,$P(GEN,$C(0),6)
 G:TYPE="ATTRIBUT" PRESATT G:TYPE="VERBE" PRESVRB G:TYPE="INDIVIDU" PRESIND
 G:TYPE="TEXTE" PRESTXT G:TYPE="ATTRIBUT.TEMPORAIRE" PRESAT2
 Q
PRESATT I $P(TX,$C(0),7)=$C(1) W !," suppression de l'attribut ",$P(TX,$C(0),5),"(",$P(TX,$C(0),6),")"," de l'individu ",$P(TX,$C(0),4)," du repertoire ",$P(TX,$C(0),3) Q
 W !," affectation de l'attribut ",$P(TX,$C(0),5),"(",$P(TX,$C(0),6),")"," de l'individu ",$P(TX,$C(0),4)," du repertoire ",$P(TX,$C(0),3)," avec la valeur ",$P(TX,$C(0),7)
 Q
PRESAT2 I $P(TX,$C(0),5)=$C(1) W !," suppression de l'attribut temporaire ",$P(TX,$C(0),3) Q
 W !," affectation de l'attribut temporaire ",$P(TX,$C(0),3),"(",$P(TX,$C(0),4),")"," avec la valeur ",$P(TX,$C(0),5) Q
PRESVRB W !,"utilisation du verbe ",$P(TX,$C(0),3) Q
PRESIND I $P(TX,$C(0),5) W !,"creation de l'individu ",$P(TX,$C(0),4)," dans le repertoire ",$P(TX,$C(0),3) Q
 W !,"suppression de l'individu ",$P(TX,$C(0),4)," du repertoire ",$P(TX,$C(0),3) Q
 Q
PRESTXT W !,$P(TX,$C(0),3) Q
PREMPAGE W !,?5,"DEBUT",!,?10,"DE",!,?15,"L'ETUDE"
 W !,!,"traitement",?12,$P(GEN,$C(0))
 W !,"repertoire",?12,$P(GEN,$C(0),2)
 W !,"individu",?12,$P(GEN,$C(0),3)
 Q
 
 
FENREG N LIGNE,COUR
 S ICOM=INST F %IC=0:0 Q:$D(@GJOURN@(ICOM,"D"))  S ICOM=$ZP(@GJOURN@(ICOM))
 S LIGNE=@GJOURN@(ICOM,"T")
 W /COLOR(0,3)
 S DX=0,DY=0 X XY
 W LIGNE Q
 
GLOA(GEN) 
 N TRT,REG
 S TRT=$P(GEN,$C(0),3),REG=$P(GEN,$C(0),4)
 Q "^[QUI]RQSDON(""ANTRT"","""_TRT_""","_REG_",""EXPA"")"
 
GLOAET(GEN) N ETUREG
 S ETUREG=$P(GEN,$C(0),7)
 Q "^[QUI]RQSDON(""EXPLTRT"","_ETUREG_",""A"")"
GLOC(GEN) N TRT,REG
 S TRT=$P(GEN,$C(0),3),REG=$P(GEN,$C(0),4)
 Q "^[QUI]RQSDON(""ANTRT"","""_TRT_""","_REG_",""EXPC"")"
 
GLOCET(GEN) N ETUREG
 S ETUREG=$P(GEN,$C(0),7)
 Q "^[QUI]RQSDON(""EXPLTRT"","_ETUREG_",""C"")"
 
AFFIVAL(TYPE,DESC,VAL) 
 I TYPE="INDIVIDU" Q $$^%QZCHW("Individu ")_$P(VAL,$C(0),2)_$C(0)_$$^%QZCHW("Du repertoire ")_$P(VAL,$C(0))
 Q VAL

