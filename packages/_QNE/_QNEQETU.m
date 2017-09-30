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

;%QNEQETU^INT^1^59547,73879^0
QNEQETU ;
 
 
 
 
 
 
 
REP() Q "ETUDE.I"
 
 
POP() Q $$GEN^%QCAPOP("EQX")
 
POPL() Q $$GEN^%QCAPOP("EQL")
 
 
SUP(NOM) 
 N ETU,LLISTEN
 S ETU=$$REP
 I $$^%QSCALVA(ETU,NOM,"TYPE.ETUDE")'="EQUILIBRAGE" Q
 D MSG^%VZEATT($$^%QZCHW("Suppression en cours"))
 S LLISTEN=$$^%QSCALVA(ETU,NOM,"LISTE.POSTES")
 D SUPL(LLISTEN),SX^%QSGESTK(ETU,NOM),POCLEPA^%VVIDEO
 Q
 
SUPL(LLISTEN) 
 N ADR,I,L
 S ADR=$$ADRLIS^%QSGEST7(LLISTEN)
 I (ADR="")!(ADR=0) D DEL^%QSGES11(LLISTEN) Q
 S L="" F I=0:0 S L=$O(@ADR@(L)) Q:L=""  D DEL^%QSGES11(L)
 D DEL^%QSGES11(LLISTEN)
 Q
 
 
AJOUT(NOM,ATT,VAL,OR) 
 N ETU
 S ETU=$$REP
 D PA^%QSGESTI(ETU,NOM,"NOM",NOM,1)
 D PA^%QSGESTI(ETU,NOM,ATT,VAL,OR)
 Q
 
SUPA(NOM,ATT) 
 D PSV^%QSGESTI($$REP,NOM,ATT)
 Q
 
AJOUTL(NOM,L) 
 D AJOUT(NOM,"LISTE.POSTES",L,1)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
VERIF(NOM,REPG,LIS,GAM,CATT,C,TAL,TAG,INSEP,INCOMP) 
 N MSG
 I REPG="" S REPG="GAMME"
 I '($$EXGAM^%MZINTER(REPG)) Q REPG_" "_$$^%QZCHW("n'est pas un repertoire gamme")
 I GAM'="",'($$IR^%QSGEST5($$NOMINT^%QSF(REPG),GAM)) Q $$^%QZCHW("La gamme")_" "_GAM_" "_$$^%QZCHW("n'existe pas")
 I '($$EX^%QSGEST7(LIS)) S LIS=""
 D RECUP(NOM,REPG,.GAM,.LIS,.MSG) Q:MSG'="" MSG
 I CATT="" Q $$^%QZCHW("l'attribut capacite n'a pas ete defini")
 I '($$POS^%QZNBN(C)) Q $$^%QZCHW("le cycle est invalide")
 I TAL=0 S TAL=""
 I TAG=0 S TAG=""
 I TAL'="",'($$EXISTE^%TLINTER(TAL)) Q $$^%QZCHW("traitement d'acceptation local inconnu")
 I TAG'="",'($$EXISTE^%TLINTER(TAG)) Q $$^%QZCHW("traitement d'acceptation global inconnu")
 I INSEP=0 S INSEP=""
 I INSEP'="" S MSG=$$VERIF1(REPG,GAM,INSEP,"S") I MSG'="" Q MSG
 I INCOMP=0 S INCOMP=""
 I INCOMP'="" S MSG=$$VERIF1(REPG,GAM,INCOMP,"C") I MSG'="" Q MSG
 Q ""
 
VERIF1(REPG,GAM,INSEP,UTIL) 
 N ADR,I,L,MSG,OO
 I '($$EX^%QSGEST7(INSEP)) Q $$^%QZCHW("liste des groupes des")_" "_$$^%QZCHW($S(UTIL="S":"inseparables",1:"incompatibles")_" inconnue")
 S MSG="",ADR=$$ADRLIS^%QSGEST7(INSEP)
 I (ADR=0)!(ADR="") Q $$^%QZCHW("impossible de retrouver les listes")
 S OO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIGNES.ERREURS") K @(OO)
 S L=""
 F I=0:0 S L=$O(@ADR@(L)) Q:L=""  S MSG=$$VERIF2(L) Q:MSG'=""
 Q MSG
VERIF2(L) 
 I '($$EX^%QSGEST7(L)) Q $$^%QZCHW("liste")_" "_L_" "_$$^%QZCHW("inconnue")
 D INTER^%QFGRVER(L,REPG,GAM,OO,.OK)
 I OK=0 Q @OO@(1)
 Q ""
 
 
RECUP(NOM,REPG,GAM,LIS,MSG) 
 N %O,O,LLISTE,OK,ERR
 S MSG=""
 I REPG="" S REPG="GAMME"
 I (GAM="")&(LIS="") S MSG=$$^%QZCHW("Vous devez definir soit une liste d'operations, soit une gamme") Q
 I LIS="" G CRLI
 I GAM="" D RECGAM Q:MSG'=""
 S ERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERREURS") K @(ERR)
 
 D INTER^%QFGRVER(LIS,REPG,GAM,ERR,.OK)
 I OK=0 S MSG=@ERR@(1)
 K @(ERR)
 Q
CRLI 
 N FILS,BASE
 S FILS=$$OI^%MZINTER(REPG)
 S BASE=$$NOMINT^%QSF(REPG)
 S LLISTE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LLISTE") K @(LLISTE)
 S LIS=$$NOM^%QSGES11("RQS")
 D MSG^%VZEATT($$^%QZCHW("Creation de la liste d'entree")_" "_LIS)
 D CRETYP^%QSGES11(FILS,LIS,"RQS",0,"EQUILIBRAGE",$$STO^%QSGES11(LIS),$$^%QZCHW("LISTE.D'ENTREE DE")_" "_NOM,"INDIVIDU",$$STOTRI^%QSGES11)
 D PA^%QSGESTI("L0",LIS,"NOM.GAMME",GAM,1)
 
 D LISTE^%QSCALVA(BASE,GAM,$$LIEN1^%QSGEL2(BASE,FILS,2),LLISTE)
 
 S O="" F %O=0:0 S O=$O(@LLISTE@(O)) Q:O=""  D STOCK^%QSGES11(LIS,GAM_","_@LLISTE@(O))
 D CARDL^%QSGES11(LIS,.O)
 Q
 
RECGAM 
 S GAM=$$^%QSCALVA("L0",LIS,"NOM.GAMME")
 I GAM'="" Q
 
 N ADR
 S ADR=$$ADRLIS^%QSGEST7(LIS) I (ADR="")!(ADR=0) S MSG=$$^%QZCHW("L'adresse de la liste")_" "_LIS_" "_$$^%QZCHW("est indefinie") Q
 S GAM=$$NOMPERE^%QSGES10($$BASE^%QSGEST7(LIS),$O(@ADR@("")))
 Q

