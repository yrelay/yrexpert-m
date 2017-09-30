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

;%TLBAAC1^INT^1^59547,74028^0
TLBAAC1 ;
 
ITER 
 K @(TEMPO) S @TEMPO@(1)="IN",@TEMPO@(2)="VAR",@TEMPO@(3)="ORD"
 S @TEMPO@(4)="RPER",@TEMPO@(5)="VPER",@TEMPO@(6)="ETIQ"
 S @TEMPO@(7)="LLIST",@TEMPO@(8)="TTYP",@TEMPO@(9)="NOE"
 S @TEMPO@(10)="OBJ",@TEMPO@(11)="BA",@TEMPO@(12)="ECHGL"
 S @TEMPO@(13)="PARTIE",@TEMPO@(14)="ARRET",@TEMPO@(15)="I"
 S @TEMPO@(16)="T",@TEMPO@(17)="TRBOUC"
 D EMPV^%ANGEPIL(TEMPO)
 
 I (MODAF'=0)&(MODEX'=3) D ADD^%TLIFEN("LOG",$$^%QZCHW("  Iteration sur les fils"))
 S VAR=$$RED($$RED(ACTI,1),"TEXTE")
 S ORD=$$RED($$RED(ACTI,2),"TEXTE")
 I MODEX=3 G NOEATL
 I $D(CXT(VAR)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_VAR_$$^%QZCHW(" deja utilisee")) S ECHEC=1 G FFITER
 I $D(CXT(ORD)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_ORD_$$^%QZCHW(" deja utilisee")) S ECHEC=1 G FFITER
NOEATL 
 S NOE=$$RED(ACTI,3)
 S ETIQ=$$RED($$RED(ACTI,4),"TEXTE")
 
 I '($$ATTR^%TLIACT4(NOE,.RPER,.VPER,.OBJ,.BA)) S ECHEC=1 G FFITER
 S LLIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LLIST")
 I '($D(@LLIST)) S @LLIST=0
 S @LLIST=@LLIST+1
 S LLIST=$$CONCAT^%QZCHAD(LLIST,@LLIST)
 K @(LLIST)
 D MVG^%QSCALVA(BA,OBJ,RPER,LLIST,.TTYP)
 I @LLIST=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_OBJ_"--->"_$$^%QZCHW("Pas d'individu fils")) S ECHEC=1 G FFITER
 S NOE=$S(TTYP=2:OBJ_",",1:"")
 S BA=$$REPD^%QSGEL2(BA,RPER)
 I BA="" D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("La base ")_RPER_$$^%QZCHW(" n'existe pas")) S ECHEC=1 G FFITER
 
 S IN="",ARRET=0,PARTIE="",TRBOUC=1
 
 I MODEX=3 S IN=@GLOETD@(NIVEAU+1,"INDIVIDU.COURANT"),ECHEC=@GLOETD@(NIVEAU+1,"ECHEC.LOCAL")
AJIND 
 I MODEX'=3 S IN=$O(@LLIST@(IN))
 I IN="" G AJINDF
 I (ARRET=1)!(ABANDON!HALT) G AJINDF
 
 S CXT(VAR,"OBJET")=NOE_@LLIST@(IN),CXT(VAR,"BASE")=BA
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,NOE_@LLIST@(IN),1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,IN,1)
 D:MODAF=1 CLEAR^%TLBAGF2("ATT")
 I MODAF=1 D ADD^%TLIFEN("ATT",NOE_@LLIST@(IN))
 I (MODAF=2)&(MODEX'=3) D ADD^%TLIFEN("LOG",$$^%QZCHW("  individu")_" : "_NOE_@LLIST@(IN)_", "_$$^%QZCHW("repertoire")_" : "_RPER)
 
 D EMPIL^%ANGEPIL("RETITER^%TLBAAC1")
 G ^%TLBADEB
RETITER 
 I ECHGL>0 S ECHEC=1
 
 K CXT(VAR),CXT(ORD)
 G AJIND
AJINDF 
 K @(LLIST)
 S LLIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LLIST")
 S @LLIST=@LLIST-1
 I LLIST=0 K @(LLIST)
 I (MODAF'=0)&(('(ABANDON))&('(HALT))) D ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin de l'iteration")) I MODAF=2 D REAF^%TLBAIF(2)
 I ABANDON=2 S @GLOETD@(NIVEAU+1,"INDIVIDU.COURANT")=IN,@GLOETD@(NIVEAU+1,"ECHEC.LOCAL")=ECHEC
FFITER 
 G DEPIL^%ANGEPIL
 
 
ITERVAL 
 K @(TEMPO) S @TEMPO@(1)="IN",@TEMPO@(2)="ARRET",@TEMPO@(3)="VAR"
 S @TEMPO@(4)="ORD",@TEMPO@(5)="RPER",@TEMPO@(6)="VPER"
 S @TEMPO@(7)="ETIQ",@TEMPO@(8)="LLIST"
 S @TEMPO@(9)="TTYP",@TEMPO@(10)="NOE",@TEMPO@(11)="OBJ"
 S @TEMPO@(12)="BA",@TEMPO@(13)="ECHGL",@TEMPO@(14)="PARTIE"
 S @TEMPO@(15)="I",@TEMPO@(16)="T",@TEMPO@(17)="TRBOUC"
 
 D EMPV^%ANGEPIL(TEMPO)
 
 I (MODAF'=0)&(MODEX'=3) D ADD^%TLIFEN("LOG",$$^%QZCHW("  Iteration sur un attribut multivalue"))
 S VAR=$$RED($$RED(ACTI,1),"TEXTE")
 S ORD=$$RED($$RED(ACTI,2),"TEXTE")
 I MODEX=3 G NOEATT
 I $D(CXT(VAR)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_VAR_$$^%QZCHW(" deja utilisee")) S ECHEC=1 G FFITRV
 I $D(CXT(ORD)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_ORD_$$^%QZCHW(" deja utilisee")) S ECHEC=1 G FFITRV
NOEATT 
 S NOE=$$RED(ACTI,3)
 S ETIQ=$$RED($$RED(ACTI,4),"TEXTE")
 
 S VPER=$$RED(NOE,3) I VPER=0 S BA=CXT("@","BASE"),OBJ=CXT("@","OBJET") G SUITIT
 S OBJ=$$RED(VPER,"TEXTE")
 G:$E(OBJ)'="%" SUITI
 S VPER=OBJ,BA=$$^%QCAZG("CXT(OBJ,""BASE"")"),OBJ=$$^%QCAZG("CXT(OBJ,""OBJET"")")
 I (BA="")!(OBJ="") D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner l'individu ")_VPER) S ECHEC=1 G FFITRV
 G SUITIT
SUITI S BA=$$NOMINT^%QSF(OBJ),OBJ=$$OBJPROX^%QSCALVU(OBJ,CXT("@","BASE"),CXT("@","OBJET"))
 I (BA="")!(OBJ="") D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner l'individu ")) S ECHEC=1 G FFITRV
SUITIT S RPER=$$RED($$RED(NOE,1),"TEXTE")
 S LLIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LLISTVAL")
 I '($D(@LLIST)) S @LLIST=0
 S @LLIST=@LLIST+1
 S LLIST=$$CONCAT^%QZCHAD(LLIST,@LLIST)
 K @(LLIST)
 D MVG^%QSCALVA(BA,OBJ,RPER,LLIST,.TTYP)
 I @LLIST=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_RPER_"--->"_$$^%QZCHW(" Attribut inexistant")) S ECHEC=1 G FFITRV
 
 S IN="",ARRET=0,PARTIE="",TRBOUC=1
 
 I MODEX=3 S IN=@GLOETD@(NIVEAU+1,"INDIVIDU.COURANT"),ECHEC=@GLOETD@(NIVEAU+1,"ECHEC.LOCAL")
AJINDV 
 I MODEX'=3 S IN=$O(@LLIST@(IN))
 I IN="" G FITVAL
 I (ARRET=1)!(ABANDON!HALT) G FITVAL
 
 S CXT("%",VAR)=@LLIST@(IN),CXT("%",ORD)=IN
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,@LLIST@(IN),1),PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,IN,1)
 
 D EMPIL^%ANGEPIL("RETVAL^%TLBAAC1")
 G ^%TLBADEB
RETVAL 
 I ECHGL>0 S ECHEC=1
 
 G AJINDV
FITVAL 
 K @(LLIST)
 S LLIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LLISTVAL")
 S @LLIST=@LLIST-1
 I @LLIST=0 K @(LLIST)
 I (MODAF'=0)&(('(ABANDON))&('(HALT))) D ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin de l'iteration")) I MODAF=2 D REAF^%TLBAIF(2)
 I ABANDON=2 S @GLOETD@(NIVEAU+1,"INDIVIDU.COURANT")=IN,@GLOETD@(NIVEAU+1,"ECHEC.LOCAL")=ECHEC
FFITRV 
 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

