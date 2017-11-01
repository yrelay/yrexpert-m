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
;! HL002 ! HL     ! 01/11/17 ! %GTM-E-FALLINTOFLST, Fall-through to a label with formallist is not allowed !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QMNF4^INT^1^59547,73879^0
QMNF4(BASE,OBJET,LIEN,GLO,PROFMX) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N NIV S NIV=0 G DEB
 
NIV(BASE,OBJET,LIEN,LIST,NIV) 
 
 
 
 
 
 
 
 
 
 N GLO
 S @LIST=0,GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GLO)
DEB 
 N RR,TABLIEN,TYPE,FILS,FILSS,OBJ,OBJS,QTE,LIMITE,MESS,PROF,XETOILE
 N ATLI,ATIND,GL,%ATRIB,%AT,%U
 S TABLIEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TABLIEN")
 S OBJ=OBJET,PROF=0 I NIV'=0 S LIMITE=999999 G SUITE
CODE D POCLEPA^%VVIDEO
 S %ABORT=0,GL=$$ADRES^%QMNF40
 I '($D(@GL@(1))) D INIT^%QMNF40
 D POCLEPA^%VVIDEO
 S RR=$$^%VZECH2($$^%QZCHW("Affichage de l'arbre en configuration")_" : ","Courante","Autre")
 I ($E(RR)'="A")&($E(RR)'="C") S %ABORT=1 Q
 I $E(RR,1)="A" D CONFIG^%QMNF40
 I %ABORT Q
 S LIMITE=@GL@(2) I @GL@(1)="OUI" S LIMITE=999999
 I @GL@(3)="AUTRE" D ^%QAXCODE
SUITE I NIV=0 S MESS=$$^%QZCHW("Construction de l'arbre")_"..." D ^%VZETOI
 S PROFMX=LIMITE
 D IN
 N PILE S PILE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PILE") K @(PILE) S @PILE=0
 D INITFI^%QCASTA(PILE)
 S FILS=""
LOOP 
 ;HL002 I NIV=0 D ^%VZATOU(.TO,.FL,0,0) I TO=1 D ABEND(.%ABORT) I %ABORT G FIN
 I NIV=0 D VVZATOU^%VZATOU(.TO,.FL,0,0) I TO=1 D ABEND(.%ABORT) I %ABORT G FIN
 S FILS=$O(@GLO@(OBJ,FILS))
 I (FILS="")&(OBJ=OBJET) G FIN
 I FILS="" D DEPIL G LOOP
 S OBJS=OBJ,FILSS=FILS
 S OBJ=FILS,FILS="" D IN
 I VIDE S OBJ=OBJS,FILS=FILSS G LOOP
 S CONT=OBJS_"^"_FILSS
 D PUSH^%QCASTA(PILE,CONT)
 G LOOP
FIN I NIV'=0 K @(GLO) G FINS
 
 
 
 S ATIND=""
 F %U=4:1:8 S %ATRIB=@GL@(%U) I %ATRIB'="" S %AT=$$^%QSCALVA(BASE,OBJET,%ATRIB),ATIND=ATIND_%AT_"/"
 S ATIND=$E(ATIND,1,$L(ATIND)-1)
 S @GLO@(OBJET,"%@RACINE")=ATIND
 
FINS K @(PILE),@(TABLIEN)
 D:NIV=0 FIN^%VZETOI
 Q
 
ABEND(ABD) 
 N RRA
 D POCLEPA^%VVIDEO
 S RRA=$$MES^%VZEOUI($$^%QZCHW("Abandon immediat")_" ? ","N")
 S ABD=0 I RRA S ABD=1
 D POCLEPA^%VVIDEO
 Q
IN 
 I $D(@GLO@(OBJ)) S VIDE=1 Q
 S PROF=PROF+1 I PROF>LIMITE S PROF=PROF-1,VIDE=1 Q
 I NIV=0 D TOP^%VZETOI
 S VIDE=0 K @(TABLIEN),TYPE
 D MVG^%QSCALVA(BASE,OBJ,LIEN,TABLIEN,.TYPE)
 I @TABLIEN=0 S PROF=PROF-1,VIDE=1 Q
 G IN2:NIV'=0
 S OR="" F %U=0:0 S OR=$O(@TABLIEN@(OR)) Q:OR=""  D RECH(.ATLI,.ATIND) S:'($D(@GLO@(OBJ,@TABLIEN@(OR)))) @GLO@(OBJ,@TABLIEN@(OR))=ATLI,@GLO@(OBJ,@TABLIEN@(OR),"FILS")=ATIND
 Q
IN2 
 S OR="" F %U=0:0 S OR=$O(@TABLIEN@(OR)) Q:OR=""  D IN21
 Q
IN21 
 S QTE=$$^%QSCALVA($$LIENI^%QSGEL3,$$NOML^%QSGES20(OBJ,OR,LIEN,OR),"QUANTITE")+0
 S:'($D(@GLO@(OBJ,@TABLIEN@(OR)))) @GLO@(OBJ,@TABLIEN@(OR))=$S(QTE'=0:QTE,1:1) I PROF=NIV S @LIST@(@TABLIEN@(OR))="",@LIST=@LIST+1
 Q
 
RECH(ATL,ATA) 
 N %I,RC,ATRIB,ATT
 S ATL="",ATA=""
 S RC=$$LIENI^%QSGEL3
 F %I=9:1:13 S ATRIB=@GL@(%I) I ATRIB'="" S ATT=$$^%QSCALVA(RC,$$NOML^%QSGES20(OBJ,OR,LIEN,OR),ATRIB),ATL=ATL_ATT_"/"
 S RC=$$REPD^%QSGEL2(BASE,LIEN)
 F %I=4:1:8 S ATRIB=@GL@(%I) I ATRIB'="" S ATT=$$^%QSCALVA(RC,@TABLIEN@(OR),ATRIB),ATA=ATA_ATT_"/"
 S ATL=$E(ATL,1,$L(ATL)-1),ATA=$E(ATA,1,$L(ATA)-1)
 Q
DEPIL I $$INDICE^%QCASTA(PILE)=0 S FILS=OBJ,(OBJ,CONT)=OBJET,PROF=0 D PUSH^%QCASTA(PILE,CONT) Q
 S CONT=$$POP^%QCASTA(PILE),OBJ=$P(CONT,"^",1),FILS=$P(CONT,"^",2),PROF=PROF-1 Q
LIST 
 Q
 
TEST 
 D CLEPAG^%VVIDEO
 N TEMP,RESUL,BASI,A
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 D REP^%QMNF2(.OK) I '(OK) K @(TEMP) Q
 S NOMENC=$$CONCAS^%QZCHAD(TEMP,"NOMENCLATURE")
 D QMNF4($$NOMINT^%QSF(REP),IND,LIEN,NOMENC)
 K @(TEMP)
 Q

