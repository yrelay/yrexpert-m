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

;%DLANITF^INT^1^59547,73867^0
DLANITF ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MOUV(REP,LAN,BNI,NBJOUR,SENS,CAPLIM,LRES,ERR) 
 N STA,ART,REPA,OPM,TMP,VISU,DEL,DELIM,I,LIEN,QU,%I,GLO,TYP,COMPOSANT
 N OP,REGMAC,TIN,%I,NUMOP,NOMOP,MAC,CHARG,NOSEM,MAXDEL,GAM
 N TYPLAN,TEMPO,LIENINV,MODAF,ADRET,REPMACH,REPART,REPLAN,REPGAM,OPVU
 N PERE,TETE,IBNI,ETUDE,ERRNONBL,DUJAL,FAMTEC,COCONT,MAXITER,DECAL
 N REGMAC,OP,DUJAL,TIN,TININV,NTRAIT,MAP,DATDUJ
 S MODAF=0,ERRNONBL=0,MAP=0
 S VISU=1,DATDUJ=$P($H,",")
 S IBNI=BNI,I=IBNI
 S TMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TMP)
 S OPM=$$CONCAS^%QZCHAD(TMP,"RESU")
 S OP=$$CONCAS^%QZCHAD(TMP,"OP")
 S REGMAC=$$CONCAS^%QZCHAD(TMP,"REGIME")
 S GLO=$$CONCAS^%QZCHAD(TMP,"MVG")
 S FAMTEC=$$CONCAS^%QZCHAD(TMP,"FAM.TEC")
 S REPA=$$ART^%DLCON2
 S LIENINV=$$LINV^%DLCON2
 S ATMAC=$$MACHINE^%DLCON2
 S ATCHARG=$$CHARGAR^%DLCON2
 S DATJAL=$$DATEJAL^%DLCON2
 S LIEN=$$LIEN1^%QSGEL2(REP,REPA,3)
 S ART=$$^%QSCALVA(REP,LAN,LIEN)
 S ETUDE=$$^%QSCALVA(REP,LAN,"ETUDE")
 S QU=$$^%QSCALVA($$REP^%DLETUDE,ETUDE,"DECALAGE")
 S (COCONT,MAXITER)=0
 I QU="NON" S DECAL=0 G SUIT
 S COCONT=$$^%QSCALVA($$REP^%DLETUDE,ETUDE,"CONTRACTION")
 S MAXITER=$$^%QSCALVA($$REP^%DLETUDE,ETUDE,"NOMBRE.ITERATIONS")
 S QU=$$^%QSCALVA($$REP^%DLETUDE,ETUDE,"TYPE.DECALAGE")
 I QU="C" S DECAL=1,MAXITER=0 G SUIT
 I QU="R" S DECAL=3,COCONT=0 G SUIT
 S DECAL=2
SUIT I ART="" S ERR=12 G AFFER
 S TETE=ART
 S GAM=$$^%QSCALVA(REP,LAN,"GAMME")
 I GAM="" S ERR=20 G AFFER
 S COMPOSANT=ART_","_GAM
 S DEL=$P($$^%QSCALVA(REP,LAN,$$DELAI^%DLCON2),",",1)
 I DEL="" S ERR=13 G AFFER
 S TYPLAN=$$AIR^%QSGE5(REPA,ART,LIENINV)
 D FIN^%DLJEVAL
 D INIGLOB^%DLJEVAL(REPA,REP,ART,LAN)
 S DELIM=$P($$^%QSCALIN(REP,LAN,$$DATEJAL^%DLCON2,I),",",1)
 I DELIM="" S ERR=15 G AFFER
 S DELIM=DELIM+NBJOUR
 I SENS=1 S TYP=DEL,DEL=DELIM,DELIM=TYP
 S QU=$$^%QSCALVA(REP,LAN,"QUANTITE")
 I QU="" S ERR=16 G AFFER
 G:TYPLAN NOMEN
 
 
 S ADRET="FIN^%DLANITF"
 N ATUER
 G ENTR^%DLGPART
 
FIN D STOETU^%DLANCEX(LRES,ETUDE)
FIN2 D FIN^%DLJEVAL
 
 D CLEPAG^%VVIDEO
 D AFFERR^%QULIMZ(LRES,"Resultats")
 K @(LRES),@(TMP)
 Q
 
 
NOMEN 
 D INIT^%ANGEPIL
 K ^RESSOUR($J)
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PILE")
 K @(TEMPO)
 S @TEMPO@(1)="DUFAB",@TEMPO@(2)="TEMPL",@TEMPO@(3)="GLNOM",@TEMPO@(4)="LLIST",@TEMPO@(5)="REPLIEN",@TEMPO@(6)="INVLIEN",@TEMPO@(7)="LIEN",@TEMPO@(8)="MACH",@TEMPO@(9)="CHARG",@TEMPO@(10)="QUANTI"
 S @TEMPO@(11)="LISREST",@TEMPO@(12)="OPMODT",@TEMPO@(13)="TRT",@TEMPO@(14)="RESST",@TEMPO@(15)="EXART",@TEMPO@(16)="LIENGA",@TEMPO@(17)="ATCHARG",@TEMPO@(18)="ATMACH",@TEMPO@(19)="ARTI"
 S @TEMPO@(20)="OPMOD2",@TEMPO@(21)="OPMODT2",@TEMPO@(22)="RESST2",@TEMPO@(23)="REGIME",@TEMPO@(24)="STOMAC",@TEMPO@(25)="STOCHARG",@TEMPO@(26)="NIVE",@TEMPO@(27)="PAR",@TEMPO@(28)="BI"
 S @TEMPO@(31)="GREJAL1",@TEMPO@(29)="GREJAL2",@TEMPO@(30)="GREJ1",@TEMPO@(32)="RES",@TEMPO@(33)="PY"
 S @TEMPO@(34)="I",@TEMPO@(35)="ADRT",@TEMPO@(36)="%I",@TEMPO@(37)="DJ"
 S @TEMPO@(38)="OP",@TEMPO@(39)="DEL1",@TEMPO@(40)="DEL2",@TEMPO@(41)="TIN"
 S @TEMPO@(42)="MAXDEL",@TEMPO@(43)="COMPOSANT",@TEMPO@(44)="PREC"
 S @TEMPO@(45)="PREC1",@TEMPO@(46)="ARNONVU",@TEMPO@(47)="DEL10"
 S @TEMPO@(48)="DEL11",@TEMPO@(49)="DEL12"
 D EMPV^%ANGEPIL(TEMPO)
 D EMPIL^%ANGEPIL("NOMFIN^%DLANITF")
 S DJ=$$DATEJAL^%DLCON2,ADRET="NOMFIN^%DLANITF"
 S RES=LRES
 G ENTR^%DLNOMPA
 
NOMFIN D EPIL^%ANGEPIL
 G FIN
 
AFFER D INSERR^%DLUTIL(REPA,ART,ERR,LRES)
 G FIN2

