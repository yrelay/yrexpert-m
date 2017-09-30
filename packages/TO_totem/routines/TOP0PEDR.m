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

;TOP0PEDR^INT^1^59547,74874^0
TOP0PEDR ;
 
 S NOMTAB="^%QUERY3($I)",ADR="TRAIT^TOP0PEDR",DX=0,DY=6 D CLEBAS^%VVIDEO
LECSUP S DX=0,DY=12 X XY W $$L19^%QSLIB1 R *SUP D TOUCHE^%INCCLAV(SUP,.SUP) G:(SUP=1)!(SUP=6) FIN I (SUP'=69)&(SUP'=73) G LECSUP
 S SUP=$S(SUP=69:"E",1:"I"),LILIM=15 I SUP="I" S LILIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS),1:60)
BEG K ^POSENR($I),^POSFUL($I),^TOTCUM($I),^POSREQ($I) S (TO,TONTOT)=0,DX=0,DY=6,LG=0,PAGE=0 D CLEBAS^%VVIDEO W "Un instant..." S NUREQ=-1 F %U=0:0 S NUREQ=$N(@NOMTAB@(NUREQ)) Q:NUREQ=-1  D @ADR
FIN K NUREQ,LILIM,FEND,ARC,LIGNE,%GLO,%II,%JJ,PA,LINE,PAR,B1,B2,B3,%RS,NOMTAB,ADR,%RS,GL,REQUET,%NN,NR,OUET,COND,CONDI,%NNN
 Q
TRAIT Q:'($D(^%QUERADM($I,NUREQ)))  D TREQ S ARC=-1,FEND=^%QUERADM($I,NUREQ),ARC=-1 F AR=1:1:FEND S ARC=$N(^%QUERADM($I,NUREQ,ARC)) D TRAIT1
 S ^TONCUM($I,PAGE)=TO,TONTOT=TONTOT+TO,^TONCUM($I,"TOTAL")=TONTOT Q
TRAIT1 Q:'($D(^[QUI]CLICHE(ARC)))  S LG=LG+1 I LG>LILIM S ^TONCUM($I,PAGE)=TO,TONTOT=TONTOT+TO,TO=0,PAGE=PAGE+1,LG=1
 S LIGNE="PP1",%GLO="^POSENR($I,PAGE,LG)" D RECPAR S LIGNE="PP2",%GLO="^POSFUL($I,PAGE,LG)" D RECPAR
 Q
RECPAR S @%GLO=ARC_"^"
 F %II=1:1 S LINE=$T(@LIGNE+%II),LINE=$P(LINE,";;",2) Q:LINE="*"  F %JJ=1:1 S PA=$P(LINE,";",%JJ) Q:PA=""  S PAR=$S($D(^[QUI]QUERY1("P0",ARC,PA)):^[QUI]QUERY1("P0",ARC,PA),1:"???"),@%GLO=@%GLO_PAR_"^" S:PA="POIDS.COMMANDE" TO=TO+PAR
 Q
TREQ S PAGE=PAGE+1,LG=0,GL=1,^POSREQ($I,PAGE,GL)="          REQUETE No "_NUREQ_" :",GL=GL+1,^POSREQ($I,PAGE,GL)=""
 S REQUET=^%QUERY3($I,NUREQ),%RS(4)="  ",%RS(1)=" "
 F %NN=1:4:32 Q:%RS(1)=""  D:%NN'=1 TR1 S OUET=%RS(4),NR=1 F %NNN=%NN:1:%NN+4 S %RS(NR)=$P(REQUET,"^",%NNN),NR=NR+1
 Q
TR1 S CONDI=%RS(1)_" ",COND=$S(%RS(2)="=":"egal a ",%RS(2)="'=":"different de ",%RS(2)="'>":"inferieur ou egal a ",%RS(2)=">":"superieur a ",%RS(2)="'<":"superieur ou egal a ",%RS(2)="<":"inferieur a ",1:"")
 I COND="" S COND=$S(%RS(2)="[":"contient ",%RS(2)="]":"contenu dans ",1:"")
 I COND'="" S COND=COND_%RS(3) G FTR1
 S COND=" appartient a l'intervalle "_$E(%RS(2),1)_%RS(3)_$E(%RS(2),2)
FTR1 S GL=GL+1,^POSREQ($I,PAGE,GL)=OUET_" "_CONDI_COND Q
PP1 
 ;;CLIENT.DESTINATAIRE;DATE.AU.PLUS.TOT;QUANTITE;POIDS.COMMANDE
 ;;*
PP2 
 ;;ALLIAGE;ETAT;LARGEUR.COMMANDEE;LONGUEUR.COMMANDEE;EPAISSEUR.COMMANDEE
 ;;*

