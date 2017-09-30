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

;%TLBAACA^INT^1^59547,74028^0
%TLBAACA ;
 
PLIEN 
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VTEMP") K @(TEMPO)
 
 S @TEMPO@(1)="MAP",@TEMPO@(2)="VAROBJ",@TEMPO@(3)="VARPER",@TEMPO@(4)="VARORD",@TEMPO@(5)="NOMLIEN"
 S @TEMPO@(6)="VARRAC",@TEMPO@(7)="ETIQ",@TEMPO@(8)="REPRACI",@TEMPO@(9)="INDRACI",@TEMPO@(10)="NUMSTR"
 S @TEMPO@(11)="TPD",@TEMPO@(12)="TPDV",@TEMPO@(13)="TRSDK",@TEMPO@(14)="XNEXT",@TEMPO@(15)="XEVPDS"
 S @TEMPO@(16)="PA",@TEMPO@(17)="O",@TEMPO@(18)="OTRI",@TEMPO@(19)="PARTIE",@TEMPO@(20)="ECHGL"
 S @TEMPO@(21)="GLOSTO",@TEMPO@(22)="TETE",@TEMPO@(23)="RETOURGO",@TEMPO@(24)="RETOUROK",@TEMPO@(25)="TYPLIEN"
 S @TEMPO@(26)="TEMPET",@TEMPO@(27)="SAVECXT",@TEMPO@(28)="NEXT",@TEMPO@(29)="REPDEST",@TEMPO@(30)="TRDOU"
 S @TEMPO@(31)="ATRTRI",@TEMPO@(32)="ORDTRI"
 D EMPV^%ANGEPIL(TEMPO)
 S MAP=$$GET^%SGVAR("MAP")
 D:(MODAF'=0)&(MODEX'=3) ADD^%TLIFEN("LOG",$$^%QZCHW("  Parcours de lien"))
 D:(MODAF'=0)&(MODEX'=3) ^%VZEATT
 
 G:MODEX'=3 LIRVAR
 
 S VAROBJ=@GLOETD@(NIVEAU+1,"VAR.OBJ")
 S VARORD=@GLOETD@(NIVEAU+1,"VAR.ORD")
 S VARPER=@GLOETD@(NIVEAU+1,"VAR.PER")
 S NOMLIEN=@GLOETD@(NIVEAU+1,"NOMLIEN")
 S ETIQ=@GLOETD@(NIVEAU+1,"ETIQUETTE")
 S REPDEST=@GLOETD@(NIVEAU+1,"REP.DEST")
 S REPRACI=@GLOETD@(NIVEAU+1,"REP.RACI")
 S INDRACI=@GLOETD@(NIVEAU+1,"IND.RACI")
 S NEXT=@GLOETD@(NIVEAU+1,"CHEM.COUR")
 G SUITE
 
 
LIRVAR S VAROBJ=$$RED($$RED(ACTI,1),"TEXTE"),VARORD=$$RED($$RED(ACTI,2),"TEXTE"),VARPER=$$RED($$RED(ACTI,3),"TEXTE")
 D SAVECXT(VAROBJ),SAVECXT(VARPER) K CXT(VAROBJ),CXT(VARPER)
 F III=VAROBJ,VARPER,VARORD D PSV^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),III)
 I MODEX=2 F III=VAROBJ,VARPER,VARORD D STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),III,"","*","SUPPRESSION")
 
 S NOMLIEN=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(NOMLIEN="") D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer nom du lien")) S ECHEC=1 G MAJIV
 S TYPLIEN=$$TYPEL^%QSGES90(NOMLIEN)
 I '(TYPLIEN) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Lien inconnu")) S ECHEC=1 G MAJIV
 
 
 S VARRAC=$$RED($$RED(ACTI,5),"TEXTE")
 I VARRAC'="",'($D(CXT(VARRAC))) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Individu symbolique inconnu")) S ECHEC=1 G MAJIV
 D LIENR^%QSGEL2(NOMLIEN,.REPRACI,.REPDEST)
 I VARRAC="",REPRACI'=CXT("@","BASE") D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Lien non valide")) S ECHEC=1 G MAJIV
 I VARRAC'="",REPRACI'=CXT(VARRAC,"BASE") D:MODAF'=0 ADD^%TLIFEN("LOG"," "_$$^%QZCHW("Lien non valide")) S ECHEC=1 G MAJIV
 S INDRACI=$S(VARRAC="":CXT("@","OBJET"),1:CXT(VARRAC,"OBJET"))
 
 
 S ETIQ=$$SUBST^%ANARBR2($$RED(ACTI,6),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(ETIQ="") D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer etiquette")) S ECHEC=1 G MAJIV
 
 
 S ATRTRI=$$RED(ACTI,7) I ATRTRI=0 S ORDTRI=1,XEVPDS="S POIDS=$S(CHEM="""":0,1:$L(CHEM,"",""))" G TRTDOU
 S ATRTRI=$$SUBST^%ANARBR2(ATRTRI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Valeur du 7eme paramatre non valide")) S ECHEC=1 G MAJIV
 S ORDTRI=$S($E(ATRTRI)=">":1,$E(ATRTRI)="<":0,1:-1)
 I ORDTRI=-1 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Valeur du 7eme paramatre non valide")) S ECHEC=1 G MAJIV
 I TYPLIEN'=2 S XEVPDS="S POIDS=$$^%QSCALIN("""_REPDEST_""",NEX,"""_$E(ATRTRI,2,$L(ATRTRI))_""",1)" G TRTDOU
 S XEVPDS="S POIDS=$$^%QSCALIN("""_REPDEST_""","""_INDRACI_",""_"_"NEX,"_""""_$E(ATRTRI,2,$L(ATRTRI))_""",1)"
 
TRTDOU S TRDOU=$$RED(ACTI,9) G:TRDOU=0 SUITE
 S TRDOU=$$SUBST^%ANARBR2($$RED(ACTI,8),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(((TRDOU'=0)&(TRDOU'=1))&(TRDOU'=2)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Valeur du 8eme paramatre non valide")) S ECHEC=1 G MAJIV
 
 
SUITE S TPDV=$$GEN^%QCAPOP("STR")
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK")
 S TEMPET=$$CONCAS^%QZCHAD(TPD,TPDV)
 S TRSDK=$$CONCAS^%QZCHAD(TEMPET,"T"),SAVECXT=$$CONCAS^%QZCHAD(TEMPET,"S")
 G:MODEX=3 REPSUIV
 S XNEXT="S NEX=$$NXTRIAV^%QSTRUC8("""_REPRACI_""",INDIV,"""_NOMLIEN_""",NEX)"
 D INIT^%QULARBU(INDRACI,XEVPDS,XNEXT,TRSDK,TRDOU,ORDTRI,TPDV,9999)
 
 
TRTNOM 
 D:MODAF'=0 POCLEPA^%VVIDEO
 S ARRET=0,PARTIE=""
 
 I MODEX=3 G REPSUIV
 S NEXT=0
SUIVANT S NEXT=$$NEXT^%QULARBU(TPDV,NEXT)
REPSUIV G:NEXT=0 FIN
 
 I $L(NEXT,",")=1 G SUIVANT
 S O=@TRSDK@($P(NEXT,",",$L(NEXT,",")))
 S PA=@TRSDK@($P(NEXT,",",$L(NEXT,",")-1))
 S CXT(VAROBJ,"BASE")=REPDEST,CXT(VARPER,"BASE")=REPRACI
 
 I TYPLIEN=2 S O=PA_","_O
 S CXT(VAROBJ,"OBJET")=O,CXT(VARPER,"OBJET")=PA
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAROBJ,O,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARPER,PA,1)
 I MAP D EMPIL^%ANGEPIL("RETETIQ^%TLBAACA") G ^%TLBADEB
 S RETOURGO="RETETIQ^%TLBAACA" G GO^%TLIACT1
RETETIQ I MAP,ECHGL>0 S ECHEC=1
 G:((ARRET=1)!ABANDON)!HALT FIN
 G SUIVANT
 
 
NOMENT I TYPLIEN=2 S O=PA_","_O
 
 
 
FIN I (MODAF'=0)&(('(ABANDON))&('(HALT))) D ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin du parcours")) I MAP,MODAF=2 D REAF^%TLBAIF(2)
 G:(('(MAP))!(ABANDON'=2))!HALT FINNSV
 
 S @GLOETD@(NIVEAU+1,"VAR.OBJ")=VAROBJ,@GLOETD@(NIVEAU+1,"VAR.ORD")=VARORD,@GLOETD@(NIVEAU+1,"VAR.PER")=VARPER,@GLOETD@(NIVEAU+1,"NOMLIEN")=NOMLIEN
 S @GLOETD@(NIVEAU+1,"ETIQUETTE")=ETIQ,@GLOETD@(NIVEAU+1,"CHEM.COUR")=NEXT,@GLOETD@(NIVEAU+1,"REP.DEST")=REPDEST,@GLOETD@(NIVEAU+1,"REP.RACI")=REPRACI,@GLOETD@(NIVEAU+1,"IND.RACI")=INDRACI
FINNSV K @(TEMPET) D NETTOIE^%QULARBU(TPDV)
 K CXT(VAROBJ),CXT(VARPER)
 F III=VAROBJ,VARPER D PSV^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),III)
 I MODEX=2 F III=VAROBJ,VARPER D STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),III,"","*","SUPPRESSION")
 D RESCXT
 I MAP G DEPIL^%ANGEPIL
 D DEPV^%ANGEPIL G REBOUCA^%TLIACT1
 
 
MAJIV I MAP G DEPIL^%ANGEPIL
 D DEPV^%ANGEPIL G REBOUCA^%TLIACT1
 
 
SAVECXT(NOMVAR) 
 N II,IJ
 Q:'($D(CXT(NOMVAR)))
 S II="" F IJ=0:0 S II=$O(CXT(NOMVAR,II)) Q:II=""  S @SAVECXT@(NOMVAR,II)=CXT(NOMVAR,II)
 Q
RESCXT N NOMVAR,IJ
 S NOMVAR="" F IJ=0:0 S NOMVAR=$O(@SAVECXT@(NOMVAR)) Q:NOMVAR=""  D RES
 Q
RES N III
 F III="BASE","OBJET" S CXT(NOMVAR,III)=@SAVECXT@(NOMVAR,III)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NOMVAR,CXT(NOMVAR,"OBJET"),1)
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

