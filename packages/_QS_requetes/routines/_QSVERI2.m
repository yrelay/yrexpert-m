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

;%QSVERI2^INT^1^59547,73883^0
QSVERI2 ;
VERIF2 
 
 
 
 
 
 N R,%R,I,MODELE,REP,J,NIP
 D DEF
 
 S R="" F %R=0:0 W "%" S R=$O(@GL1@(M,R)) Q:R=""  D AUT
 D EXAUT,EXDEF
 Q
 
VER21 S MODELE=$O(@GL1@(""))
 F I=0:0 Q:MODELE=""  D:MODELE'=M VER22 S MODELE=$O(@GL1@(MODELE))
 Q
VER22 S REP=$O(@GL1@(MODELE,""))
 F J=0:0 Q:REP=""  D VER23 S REP=$O(@GL1@(MODELE,REP))
 Q
VER23 S NIP=$P(@GL1@(MODELE,REP),"^",1)
 Q:((((NIP="L0")!(NIP="RQS"))!(NIP="ETUDE.TOTEM"))!(NIP="ATTRIBUT"))!(NIP="TRAITEMENT")
 I NIP=@TEMPO@(M,"NOM INTERNE",R) D VER24
 Q
VER24 S %VAR=NIP_$$^%QZCHW(", nom interne de ")_R_$$^%QZCHW(", est aussi celui de ")_REP_$$^%QZCHW(" dans le schema ")_MODELE,ERREUR="<WARNING>",WARN=1 D WRITE^%QSVERER
 Q
 
DEF Q:$D(^RQSMOD2(M))
 S %VAR=$$^%QZCHW("Aucun repertoire par defaut n'est defini pour ce schema..."),ERREUR="<SYNTAX>",SYNTAX=1 D WRITE^%QSVERER
 Q
 
AUT Q:$D(^RQSMOD3(M,R))
 Q:((((R="LIEN")!(R="ETUDE"))!(R="ATTRIBUT"))!(R="TRAITEMENT"))!(R="%")
 S %VAR=$$^%QZCHW("Le repertoire ")_R_$$^%QZCHW(" n'est pas un repertoire autorise"),ERREUR="<WARNING>",WARN=1 D WRITE^%QSVERER
 Q
 
 
 
LIEN N R1,%R,%U,%L,R2,L1
 S R1=""
 F %R=0:0 S R1=$O(@TEMPO@(M,"LIES",R1)) Q:R1=""  S R2="" F %U=0:0 S R2=$O(@TEMPO@(M,"LIES",R1,R2)) Q:R2=""  S L1="" F %L=0:0 S L1=$O(@TEMPO@(M,"LIES",R1,R2,L1)) Q:L1=""  D TLIEN
 Q
TLIEN 
 
 D DOUBL(L1)
 D NOML(L1)
 Q
DOUBL(L) 
 I $D(@NOLIEN@(L)) S ERREUR="<SYNTAX>",SYNTAX=1,%VAR=$$^%QZCHW("L'attribut lien ")_L_$$^%QZCHW(" est utilise plusieurs fois...") D WRITE^%QSVERER
 S @NOLIEN@(L)=""
 Q
NOML(L) 
 I $E(L,1,4)="LIEN" S ERREUR="<SYNTAX>",SYNTAX=1,%VAR=$$^%QZCHW("L'attribut lien ")_L_$$^%QZCHW(" commence par LIEN qui est un nom reserve...") D WRITE^%QSVERER
 I $E(L,1,7)="INVERSE" S ERREUR="<SYNTAX>",SYNTAX=1,%VAR=$$^%QZCHW("L'attribut lien ")_L_$$^%QZCHW(" commence par INVERSE qui est un nom reserve...") D WRITE^%QSVERER
 I $E(L,1,6)="SOURCE" S ERREUR="<SYNTAX>",SYNTAX=1,%VAR=$$^%QZCHW("L'attribut lien ")_L_$$^%QZCHW(" commence par SOURCE qui est un nom reserve...") D WRITE^%QSVERER
 I $E(L,1,11)="DESTINATION" S ERREUR="<SYNTAX>",SYNTAX=1,%VAR=$$^%QZCHW("L'attribut lien ")_L_$$^%QZCHW(" commence par DESTINATION qui est un nom reserve...") D WRITE^%QSVERER
 Q
 
 
 
 
EXAUT 
 N R,%I
 S R=""
 F %I=1:1 S R=$O(^RQSMOD3(M,R)) Q:R=""  D EX2
 Q
EX2 Q:$D(@GL1@(M,R))
 S %VAR=$$^%QZCHW("Le repertoire ")_R_$$^%QZCHW(" est un repertoire autorise, mais il n'est pas defini dans la description du schema..."),ERREUR="<SYNTAX>",SYNTAX=1 D WRITE^%QSVERER
 Q
 
 
 
 
EXDEF 
 N R
 Q:'($D(^RQSMOD2(M)))
 S R=$P(^RQSMOD2(M),"^",1)
 Q:$D(@GL1@(M,R))
 S %VAR=$$^%QZCHW("Le repertoire ")_R_$$^%QZCHW(" est le repertoire par defaut, mais il n'est pas defini dans la description du schema..."),ERREUR="<SYNTAX>",SYNTAX=1 D WRITE^%QSVERER
 Q

