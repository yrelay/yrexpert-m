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

;%SGPDOU2^INT^1^59547,73890^0
%SGPDOU2 ;
 
 
 
 
 
 
 
 
 
 
 
ECRITURE 
 N MOT,SEP,IND,TYPATT,REPDEST
 N REPS,INDS,LIEN,ORD,REPD,INDD,INDLN
 N NUMIO,OKOPEN,REP,IREP,%O
 
 
 S REP="" F %O=0:0 S REP=$O(@MARQUE@(REP)) Q:REP=""  S @TABREP@($$RANG^%QSGES17(REP),REP)=""
 
 S SEP="^"
 
 
 D OPENFILE^%SYSUTI1(FICHIER,"W",.NUMIO,.OKOPEN)
 G:'(OKOPEN) FIN
 
 D WRITE^%SYSUTI1(NUMIO,$$^%QZCHW("archivage de")_" "_WHOIS_" "_$$^%QZCHW("le")_" "_$$DATE^%QMDATE_" a "_$$HEURE^%QMDATE_"(version 1.1)")
 
 I COMM'="" D WRITE^%SYSUTI1(NUMIO,COMM)
 D WRITE^%SYSUTI1(NUMIO,"")
 
 
 
 S IREP=""
NXIREP S IREP=$O(@TABREP@(IREP)) G:IREP="" ARCHSUIT S REP=""
NXREP S REP=$O(@TABREP@(IREP,REP)) G:REP="" NXIREP S IND=""
NXIND S IND=$O(@MARQUE@(REP,IND)) G:IND="" NXREP S ORD=$$ORDRE^%QSGES10(REP,IND) D SAVE(REP,IND,ORD) G NXIND
 
ARCHSUIT 
 I MODEARCH=1 G ECRLEX
 
ECRLIEN 
 
 
 
 
 
 
 D WRITE^%SYSUTI1(NUMIO,"")
 S REPS=""
ECRLNRS S REPS=$O(@TABLIEN@(REPS)) G:REPS="" ECRLEX S INDS=""
ECRLNIS S INDS=$O(@TABLIEN@(REPS,INDS)) G:INDS="" ECRLNRS S LIEN=""
ECRLN S LIEN=$O(@TABLIEN@(REPS,INDS,LIEN)) G:LIEN="" ECRLNIS S ORD=""
ECRLNOR S ORD=$O(@TABLIEN@(REPS,INDS,LIEN,ORD)) G:ORD="" ECRLN S REPD=""
 S REPD=@TABLIEN@(REPS,INDS,LIEN,ORD)
 S INDD=$P(REPD,SEP,2),REPD=$P(REPD,SEP)
 D WRITE^%SYSUTI1(NUMIO,REPS_SEP_INDS_SEP_LIEN_SEP_ORD_SEP_REPD_SEP_INDD)
 S INDLN=$$NOML1^%QSGES20(INDS,ORD,LIEN,INDD)
 I (MODEARCH>2)&(INDLN'="") D ATTSTD(REPLIEN,INDLN)
 D WRITE^%SYSUTI1(NUMIO,"")
 G ECRLNOR
 
ECRLEX 
 S MOT=""
 D WRITE^%SYSUTI1(NUMIO,"")
LEXBCL S MOT=$O(@LEX@(MOT)) G:MOT="" FIN
 G:'($D(^[QUI]TOLEX(MOT))) LEXBCL
 D WRITE^%SYSUTI1(NUMIO,MOT)
 
 F %O=1:1:7 D WRITE^%SYSUTI1(NUMIO,$P(^[QUI]TOLEX(MOT),"^",%O))
 G LEXBCL
 
 
 
FIN D CLOSE^%SYSUTI1(NUMIO,"W")
 Q
 
 
 
 
 
SAVE(B,I,X) 
 
 N A,O,V,REPDEST
 D WRITE^%SYSUTI1(NUMIO,B_SEP_I_SEP_X)
 
 D ATTSTD(B,I)
 D WRITE^%SYSUTI1(NUMIO,"")
 I MODEARCH=1 G SAVEFIN
 
 S A=""
SAVE2 S A=$$NXTRIA^%QSTRUC8(B,I,A) G:A="" SAVEFIN
 S TYPATT=$$TYPE^%QSGEST9(B,A) G:TYPATT'=2 SAVE2 S O=""
 I '($D(@LEX@(A))) S @LEX@(A)=""
 S REPDEST=$$REPD^%QSGEL2(B,A)
 I '($D(@TABLISTE@(REPDEST))) D CREERLI(REPDEST,"ARC")
SAVE3 S O=$$NXTRIAO^%QSTRUC8(B,I,A,O) G:O="" SAVE2
 S V=$$VALEUR^%QSTRUC8(B,I,A,O)
 D AJOUTLI(REPDEST,I_","_V)
 K @MARQUE@(REPDEST,I_","_V)
 D SAVE(REPDEST,I_","_V,O)
 G SAVE3
SAVEFIN 
 Q
 
 
ATTSTD(B,I) 
 N A,O,V
 S A=""
ATTSTD2 S A=$$NXTRIA^%QSTRUC8(B,I,A) Q:A=""
 S TYPATT=$$TYPE^%QSGEST9(B,A) G:TYPATT'=0 ATTSTD2 G:A="NOM" ATTSTD2
 
 I (((A="NOM.LIEN")!(A="NUMERO.ORDRE"))!(A="REP.DESTINATION"))!(A="REP.SOURCE") G ATTSTD2
 I '($D(@LEX@(A))) S @LEX@(A)=""
 S O=""
ATTSTD3 S O=$$NXTRIAO^%QSTRUC8(B,I,A,O) G:O="" ATTSTD2
 S V=$$VALEUR^%QSTRUC8(B,I,A,O)
ATTSTD4 D WRITE^%SYSUTI1(NUMIO,A_SEP_O_SEP_V)
 I $$TYPEASP^%QMCPZ(WHOIS,QUI,B,A)="TEXTE" D ECRNOTE(B,I,O),WRITE^%SYSUTI1(NUMIO,"")
 G ATTSTD3
 
 
CREERLI(R,PRE) 
 N NLISTE
 S NLISTE=$$GEN^%QCAPOP(PRE)
 D CRETYPV^%QSGES11(R,NLISTE,PRE,"ARCHIVAGE","ARCHIVAGE","INDIVIDU")
 S @TABLISTE@(R)=NLISTE
 I R'="L0" D AJOUTLI("L0",NLISTE)
 Q
 
AJOUTLI(R,I) 
 N NLISTE
 S NLISTE=@TABLISTE@(R)
 D AJOUT^%QS0XG1(NLISTE,I)
 Q
 
ECRNOTE(B,I,O) 
 N NLIGN
 S LIGNE=""
 F NLIGN=1:1 Q:'($D(^[QUI]QUERYT(B,I,O,"LIGNE",NLIGN)))  S LIGNE=^[QUI]QUERYT(B,I,O,"LIGNE",NLIGN) D WRITE^%SYSUTI1(NUMIO,LIGNE)
 Q
 
SIMPLE

