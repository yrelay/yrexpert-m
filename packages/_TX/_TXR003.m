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

;%TXR003^INT^1^59547,74033^0
%TXR003 ;
 
 
 
 
 
 N DOS,ADR,DOS,I,CYCLE,DUREE,REGLES,MEDECIN,MOTIF,PLAINTE,INDIC,RETENUE
 N DATE,ENTREE,OPERATION,OBS1,OBS2,OBS3,RAG,REPFI,ADR2,OR,INDIV
 S ADR="^[""BB""]RMGC",RAG="PATIENT",REPFI="RMGC"
 D CLEPAG^%VVIDEO
 D BLD^%VVIDEO,REV^%VVIDEO S DX=5,DY=5 X XY W "Chargement de RMGC en cours ..."
 D NORM^%VVIDEO,DEB^%VTEMPS($P($ZPOS,"^",2))
 S DOS="" F I=1:1 S DOS=$O(@ADR@(DOS)) Q:DOS=""  Q:DOS="z"  D POCLEPA^%VVIDEO W DOS D TRAIT
 D AFF^%VTEMPS($P($ZPOS,"^",2)),NORM^%VVIDEO Q
TRAIT 
 
 
 
 
 I DOS["/" S DOS=$TR(DOS,"/",".")
 I '($$IR^%QSGEST5(RAG,DOS)) S:DOS["." DOS=$TR(DOS,".","/") Q
 D ADDO^%QSGEST3(RAG,DOS,"RMGC","RMGC",REPFI,"RMGC")
 I DOS["." S DOS=$TR(DOS,".","/")
 S VAL=@ADR@(DOS),VAL=$$ADR^%QZCHNET(VAL)
 I DOS["/" S DOS=$TR(DOS,"/",".")
 S CYCLE=$P(VAL,"^",1)
 S DUREE=$P(VAL,"^",2)
 S REGLES=$P(VAL,"^",3)
 S MEDECIN=$P(VAL,"^",4)
 S MOTIF=$P(VAL,"^",5)
 S PLAINTE=$P(VAL,"^",6)
 S INDIC=$P(VAL,"^",7)
 S RETENUE=$P(VAL,"^",8)
 S DATE=$P(VAL,"^",9)
 S ENTREE=$P(VAL,"^",10)
 S OPERATION=$P(VAL,"^",11)
 S DATEOP=$P(VAL,"^",12)
 S OBS1=$P(VAL,"^",13)
 S OBS2=$P(VAL,"^",14)
 S OBS3=$P(VAL,"^",15)
 S INDF=DOS_","_"RMGC"
 D TRAIT^%TXR007(REPFI,INDF,"CHIRURGIE")
 D PA^%QSGESTI(REPFI,INDF,"NOM","RMGC",1)
 D PA^%QSGESTI(REPFI,INDF,"CYCLE",CYCLE,1)
 D PA^%QSGESTI(REPFI,INDF,"DUREE",DUREE,1)
 D PA^%QSGESTI(REPFI,INDF,"REGLES",REGLES,1)
 D PA^%QSGESTI(REPFI,INDF,"MEDECIN.TRAITANT",MEDECIN,1)
 D PA^%QSGESTI(REPFI,INDF,"MOTIF",MOTIF,1)
 D PA^%QSGESTI(REPFI,INDF,"PLAINTE.PRINCIPALE",PLAINTE,1)
 D PA^%QSGESTI(REPFI,INDF,"INDICATION.PROPOSEE",INDIC,1)
 D PA^%QSGESTI(REPFI,INDF,"RETENUE",RETENUE,1)
 D PA^%QSGESTI(REPFI,INDF,"DATE.PREVUE",DATE,1)
 D PA^%QSGESTI(REPFI,INDF,"ENTREE",ENTREE,1)
 D PA^%QSGESTI(REPFI,INDF,"OPERATION",OPERATION,1)
 D PA^%QSGESTI(REPFI,INDF,"DATE.OPERATION",DATEOP,1)
 D PA^%QSGESTI(REPFI,INDF,"OBSERVATION",OBS1,1)
 D PA^%QSGESTI(REPFI,INDF,"OBSERVATION",OBS2,2)
 D PA^%QSGESTI(REPFI,INDF,"OBSERVATION",OBS3,3)
 I DOS["." S DOS=$TR(DOS,".","/")
 Q

