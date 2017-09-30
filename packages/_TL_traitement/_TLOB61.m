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

;%TLOB61^INT^1^59547,74030^0
%TLOB61 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EQLBRER(IDEB,NBREG) 
 N ETU,ETU1,MODE,TYPE,REP,IND,VAL,TP
 N NREP,GAMME,ENTREE,ATTCAP,CYCLE,TAL,TAG,INSEP,INCOMP,MULT,REPG
 N LGAMME,REPETU,LENT,VATTCAP,VCYCLE,REPG,NREP,ERR,NMULT
 S ERR="%ERREUR.EQUILIBRAGE"
 S VAL=V(IDEB+4)
EQU1 
 S REPETU=$$REP^%QNEQETU
 I VAL=$C(0) S ETU=$$POP^%QNEQETU,MODE="CREATION" S:V(IDEB)'=$C(0) TP=$$AFF^%TLOPT(V(IDEB+2),V(IDEB+3),V(IDEB),V(IDEB+1),ETU)
 I VAL'=$C(0) S ETU=VAL,VAL="",MODE="ACTIVATION"
 
 
 S NREP=V(IDEB+5),GAMME=V(IDEB+6),ENTREE=V(IDEB+7),ATTCAP=V(IDEB+8)
 S CYCLE=V(IDEB+9),TAL=V(IDEB+10),TAG=V(IDEB+11),INSEP=V(IDEB+12)
 S INCOMP=V(IDEB+13),MULT=V(IDEB+14)
 S REPETU=$$REP^%QNEQETU
 I MODE="CREATION" G CREQUI
 
 I '($$IR^%QSGEST5(REPETU,ETU)) S POS=0,VERR=ETU_" "_$$^%QZCHW("est une etude inconnue") D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ERR,VERR,1) Q 0
 S REPG=$$^%QSCALVA(REPETU,ETU,"REPERTOIRE.GAMME")
 I NREP="" S NREP=REPG G EQUMG
 I REPG'=NREP D PA^%QSGESTI(REPETU,ETU,"REPERTOIRE.GAMME",NREP,1)
EQUMG S LGAMME=$$^%QSCALVA(REPETU,ETU,"NOM.GAMME")
 I GAMME="" S GAMME=LGAMME G EQUML
 I GAMME'=LGAMME D PA^%QSGESTI(REPETU,ETU,"NOM.GAMME",GAMME,1)
EQUML S LENT=$$^%QSCALVA(REPETU,ETU,"LISTE.OPERATIONS.GAMME")
 I ENTREE="" S ENTREE=LENT G EQUM1
 I ENTREE'=LENT D PA^%QSGESTI(REPETU,ETU,"LISTE.OPERATIONS.GAMME",ENTREE,1)
EQUM1 S VATTCAP=$$^%QSCALVA(REPETU,ETU,"ATTRIBUT.CAPACITE")
 I ATTCAP="" S ATTCAP=VATTCAP G EQUM2
 I ATTCAP'=VATTCAP D PA^%QSGESTI(REPETU,ETU,"ATTRIBUT.CAPACITE",ATTCAP,1)
EQUM2 S VCYCLE=$$^%QSCALVA(REPETU,ETU,"CYCLE")
 I CYCLE="" S CYCLE=VCYCLE G EQUM3
 I CYCLE'=VCYCLE D PA^%QSGESTI(REPETU,ETU,"CYCLE",CYCLE,1)
EQUM3 S VERR=$$VERIF^%QNEQETU(ETU,.NREP,.ENTREE,.GAMME,ATTCAP,CYCLE,TAL,TAG,INSEP,INCOMP)
 G:VERR'="" EQUERR
 I TAL'="",TAL'=$$^%QSCALVA(REPETU,ETU,"TRAITEMENT.ACCEPTATION.LOCAL") D PA^%QSGESTI(REPETU,ETU,"TRAITEMENT.ACCEPTATION.LOCAL",TAL,1)
 I TAG'="",TAG'=$$^%QSCALVA(REPETU,ETU,"TRAITEMENT.ACCEPTATION.GLOBAL") D PA^%QSGESTI(REPETU,ETU,"TRAITEMENT.ACCEPTATION.GLOBAL",TAG,1)
 I INSEP'="",INSEP'=$$^%QSCALVA(REPETU,ETU,"LISTE.GROUPES.INSEPARABLES") D PA^%QSGESTI(REPETU,ETU,"LISTE.GROUPES.INSEPARABLES",INSEP,1)
 I INCOMP'="",INCOMP'=$$^%QSCALVA(REPETU,ETU,"LISTE.GROUPES.INCOMPATIBLES") D PA^%QSGESTI(REPETU,ETU,"LISTE.GROUPES.INCOMPATIBLES",INCOMP,1)
 I MULT'="",MULT'=$$^%QSCALVA(REPETU,ETU,"EFFECTIF.MAX.PAR.POSTE") D PA^%QSGESTI(REPETU,ETU,"EFFECTIF.MAX.PAR.POSTE",MULT,1)
ACTIEQ 
 S VERR=$$ACT^%QNEQUI2(ETU,MODAF,"AUT",1,.ABANDON)
 G:VERR'="" EQUERR
 Q 1
 
CREQUI 
 S VERR=$$VERIF^%QNEQETU(ETU,.NREP,.ENTREE,.GAMME,ATTCAP,CYCLE,TAL,TAG,INSEP,INCOMP)
 
 S VERR=""
 G:VERR'="" EQUERR
 D CREER^%QNEQET2(ETU,"Equilibrage automatique par traitement",NREP,GAMME,ENTREE,CYCLE,MULT,ATTCAP,INSEP,INCOMP,TAL,TAG,"","")
 G ACTIEQ
 
EQUERR D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ERR,VERR,1)
 Q 0

