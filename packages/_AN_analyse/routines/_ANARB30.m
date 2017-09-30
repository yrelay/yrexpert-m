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

;%ANARB30^INT^1^59547,73866^0
%ANARB30 ;
 
 
 
PREDICAT 
 N REP,NOMPRED,NOMIND,MODE,POS
 K @(TEMPO)
 S @TEMPO@(1)="REP",@TEMPO@(2)="NOMPRED",@TEMPO@(3)="NOMIND",@TEMPO@(4)="POS"
 S @TEMPO@(5)="SA",@TEMPO@(6)="MODE"
 D EMPV^%ANGEPIL(TEMPO)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation d'un predicat"))
 S SA=A,VAL=""
 S A=$$RED(SA,1)
 D EMPIL^%ANGEPIL("PRED1^%ANARB30") G INT^%ANARBR2
PRED1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible de determiner le nom du predicat")) G ERR
 S NOMPRED=VAL,VAL=""
 
 I '($$EXIPRED^%PSPRGES(NOMPRED)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  le predicat n'existe pas ")) G ERR
 S A=$$RED(SA,2)
 I A=0 S MODE=1 G PRED3
 D EMPIL^%ANGEPIL("PRED2^%ANARB30") G INT^%ANARBR2
PRED2 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible de determiner le mode d'evaluation")) G ERR
 I ((VAL'=0)!(VAL'=1))!(VAL="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW(" le mode d'evaluation prend pour valeur 0 ou 1 ")) G ERR
 S MODE=$S(VAL="":1,1:VAL),VAL=""
PRED3 S A=$$RED(SA,3)
 I A=0 S REP=CXT("@","BASE"),NOMIND=CXT("@","OBJ") G VERIND
 S NOMIND=$$RED(A,"TEXTE")
 D EMPIL^%ANGEPIL("PRED4^%ANARB30") G INT^%ANARBR2
PRED4 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible de determiner le nom de l'individu")) G ERR
 S NOMIND=VAL
 S REP=$$^%QCAZG("CXT(NOMIND,""BASE"")"),NOMIND=$$^%QCAZG("CXT(NOMIND,""OBJET"")")
VERIND 
 I (REP="")!(NOMIND="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW(" individu mal defini")) G ERR
 
 I MODE S VAL=$$EVAL^%PSPREV(NOMPRED,REP,NOMIND),POS=1 G DEPIL^%ANGEPIL
 S TRES=$$TEMP^%SGUTIL
 S VAL=$$EVAL2^%PSPREV(NOMPRED,REP,NOMIND,TRES)
 S VAL=@TRES,POS=1 K @(TRES)
 G DEPIL^%ANGEPIL
 
 
 
ARCHIDON 
 N LIND,FICHE,LATT,MODE,COM
 K @(TEMPO)
 S @TEMPO@(1)="LIND",@TEMO@(2)="FICHE",@TEMPO@(3)="LATT",@TEMPO@(4)="COM"
 S @TEMPO@(5)="SA",@TEMPO@(6)="MODE"
 D EMPV^%ANGEPIL(TEMPO)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation de l'archivage de donnees"))
 S SA=A,VAL=""
 S A=$$RED(SA,1)
 D EMPIL^%ANGEPIL("ARCD1^%ANARB30") G INT^%ANARBR2
ARCD1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible de determiner le nom de la liste d'individus ")) G ERR
 S LIND=VAL,VAL=""
 
 G:LIND="*" ARCD2
 I '($$EX^%QS0(LIND)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  la liste d'individus n'existe pas ")) G ERR
ARCD2 S A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("ARCD3^%ANARB30") G INT^%ANARBR2
ARCD3 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible de determiner le nom de la liste d'attributs ")) G ERR
 S LATT=VAL,VAL=""
 
 G:LATT="*" ARCD4
 I '($$EX^%QMLILA(LATT)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  la liste d'attributs n'existe pas ")) G ERR
ARCD4 S A=$$RED(SA,3)
 D EMPIL^%ANGEPIL("ARCD5^%ANARB30") G INT^%ANARBR2
ARCD5 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible de determiner le mode d'archivage ")) G ERR
 S MODE=VAL,VAL=""
 
 I (((VAL'=1)!(VAL'=2))!(VAL=3))!(VAL'=4) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW(" le mode d'archivage doit etre compris entre 1 et 4 ")) G ERR
 S A=$$RED(SA,4)
 D EMPIL^%ANGEPIL("ARCD6^%ANARB30") G INT^%ANARBR2
ARCD6 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible de determiner le nom du fichier ")) G ERR
 S FICHE=VAL
 S A=$$RED(SA,5)
 I A=0 S COM="archivage par traitement" G ACTARC
 D EMPIL^%ANGEPIL("ARCD7^%ANARB30") G INT^%ANARBR2
ARCD7 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible de determiner le commentaire ")) G ERR
 S COM=$S(VAL="":"archivage par traitement",1:VAL)
 
ACTARC 
 S VAL=$$ARCHIDON^%SGPDOU(LIND,LATT,MODE,FICHE,COM),POS=1
 G DEPIL^%ANGEPIL
 
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 
 
ERR S ECHEC=1,POS=0,VAL=""
 I MODAF'=0 D:MSG'=" " ADD^%TLIFEN("LOG"," "_MSG)
 G DEPIL^%ANGEPIL
 ;

